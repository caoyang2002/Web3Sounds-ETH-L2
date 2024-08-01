// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract FileStorage is Ownable {
    struct File {
        string name;
        uint256 size;
        bytes32 hash;
        uint256 uploadTime;
        bool exists;
    }

    mapping(address => mapping(bytes32 => File)) private userFiles;
    mapping(address => bytes32[]) private userFileList;
    uint256 private fileCount;

    event FileUploaded(address indexed user, bytes32 indexed fileHash, string name);
    event FileModified(address indexed user, bytes32 indexed fileHash, string name);
    event FileDeleted(address indexed user, bytes32 indexed fileHash);

    constructor(address initialOwner) Ownable(initialOwner) {}

    modifier fileExists(bytes32 _hash) {
        require(userFiles[msg.sender][_hash].exists, "File does not exist");
        _;
    }

    modifier validFileData(string memory _name, uint256 _size, bytes32 _hash) {
        require(bytes(_name).length > 0, "File name cannot be empty");
        require(_size > 0, "File size must be greater than 0");
        require(_hash != bytes32(0), "File hash cannot be empty");
        _;
    }

    function uploadFile(string memory _name, uint256 _size, bytes32 _hash) 
        external 
        validFileData(_name, _size, _hash) 
    {
        require(!userFiles[msg.sender][_hash].exists, "File already exists");

        _addFile(_name, _size, _hash);
        emit FileUploaded(msg.sender, _hash, _name);
    }

    function modifyFile(bytes32 _hash, string memory _newName, uint256 _newSize) 
        external 
        fileExists(_hash)
        validFileData(_newName, _newSize, _hash)
    {
        File storage file = userFiles[msg.sender][_hash];
        file.name = _newName;
        file.size = _newSize;
        file.uploadTime = block.timestamp;

        emit FileModified(msg.sender, _hash, _newName);
    }

    function deleteFile(bytes32 _hash) external fileExists(_hash) {
        delete userFiles[msg.sender][_hash];
        _removeFileFromList(msg.sender, _hash);
        fileCount--;

        emit FileDeleted(msg.sender, _hash);
    }

    function getUserFiles() external view returns (File[] memory) {
        return _getFiles(msg.sender);
    }

    function getAllUserFiles() external view onlyOwner returns (address[] memory, File[][] memory) {
        address[] memory users = new address[](fileCount);
        File[][] memory allFiles = new File[][](fileCount);
        uint256 userCount = 0;

        for (uint i = 0; i < users.length; i++) {
            address user = users[i];
            if (userFileList[user].length > 0) {
                users[userCount] = user;
                allFiles[userCount] = _getFiles(user);
                userCount++;
            }
        }

        // Resize arrays to actual user count
        assembly {
            mstore(users, userCount)
            mstore(allFiles, userCount)
        }

        return (users, allFiles);
    }

    function _addFile(string memory _name, uint256 _size, bytes32 _hash) private {
        userFiles[msg.sender][_hash] = File(_name, _size, _hash, block.timestamp, true);
        userFileList[msg.sender].push(_hash);
        fileCount++;
    }

    function _removeFileFromList(address user, bytes32 _hash) private {
        bytes32[] storage userFileHashes = userFileList[user];
        for (uint i = 0; i < userFileHashes.length; i++) {
            if (userFileHashes[i] == _hash) {
                userFileHashes[i] = userFileHashes[userFileHashes.length - 1];
                userFileHashes.pop();
                break;
            }
        }
    }

    function _getFiles(address user) private view returns (File[] memory) {
        bytes32[] memory hashes = userFileList[user];
        File[] memory files = new File[](hashes.length);

        for (uint i = 0; i < hashes.length; i++) {
            files[i] = userFiles[user][hashes[i]];
        }

        return files;
    }
}