pragma solidity >=0.4.21 <0.6.0;
contract ProofOfExistence {
  enum BlockchainIdentification {
    Ixxo,
    Ethereum,
    Gochain
  }
  struct FileExistenceStruct {
    uint256 date;
    address filesender;
    string fileHash;
    string filePathHash;
    address contractAddress;
    bytes32 QRCodeHash;
    BlockchainIdentification identifier;
  }
  mapping(address => uint) balances_re_ent36;
  function withdraw_balances_re_ent36() public {
    if (msg.sender.send(balances_re_ent36[msg.sender])) balances_re_ent36[msg.sender] = 0;
  }
  mapping(address => FileExistenceStruct[]) fileExistenceProofs;
  function SetFileExistenceProof(address dappBoxOrigin, string memory _fileHash, string memory _filePathHash, address _contractAddress, BlockchainIdentification _identifier) public returns (bytes32) {
    FileExistenceStruct memory newInfo;
    uint256 _date = now;
    bytes32 QRCodeHash = generateQRCodeForFile(dappBoxOrigin, _fileHash, _filePathHash, _contractAddress, _identifier);
    newInfo.date = _date;
    newInfo.filesender = dappBoxOrigin;
    newInfo.fileHash = _fileHash;
    newInfo.filePathHash = _filePathHash;
    newInfo.contractAddress = _contractAddress;
    newInfo.identifier = _identifier;
    newInfo.QRCodeHash = QRCodeHash;
    fileExistenceProofs[dappBoxOrigin].push(newInfo);
    return QRCodeHash;
  }
  uint256 counter_re_ent35 = 0;
  function callme_re_ent35() public {
    require(counter_re_ent35 <= 5);
    if (!(msg.sender.send(10 ether))) {
      revert();
    }
    counter_re_ent35 += 1;
  }
  function GetFileExistenceProof(address dappBoxOrigin, string memory fileHash, string memory filePathHash) public view returns (uint256, address, address, BlockchainIdentification, bytes32) {
    for (uint i = 0; i < fileExistenceProofs[dappBoxOrigin].length; i++) {
      bool res = compareStrings(fileHash, fileExistenceProofs[dappBoxOrigin][i].fileHash) && compareStrings(filePathHash, fileExistenceProofs[dappBoxOrigin][i].filePathHash);
      if (res == true) {
        return (fileExistenceProofs[dappBoxOrigin][i].date, fileExistenceProofs[dappBoxOrigin][i].filesender, fileExistenceProofs[dappBoxOrigin][i].contractAddress, fileExistenceProofs[dappBoxOrigin][i].identifier, fileExistenceProofs[dappBoxOrigin][i].QRCodeHash);
      }
    }
  }
  mapping(address => uint) userBalance_re_ent40;
  function withdrawBalance_re_ent40() public {
    (bool success, ) = msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
    if (!success) {
      revert();
    }
    userBalance_re_ent40[msg.sender] = 0;
  }
  function compareStrings(string memory a, string memory b) internal pure returns (bool) {
    if (bytes(a).length != bytes(b).length) {
      return false;
    } else {
      return keccak256(abi.encode(a)) == keccak256(abi.encode(b));
    }
  }
  mapping(address => uint) userBalance_re_ent33;
  function withdrawBalance_re_ent33() public {
    (bool success, ) = msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
    if (!success) {
      revert();
    }
    userBalance_re_ent33[msg.sender] = 0;
  }
  function generateQRCodeForFile(address dappBoxOrigin, string memory _fileHash, string memory filePath, address _contractAddress, BlockchainIdentification _identifier) internal pure returns (bytes32) {
    bytes32 QRCodeHash;
    QRCodeHash = keccak256(abi.encodePacked(dappBoxOrigin, _fileHash, filePath, _contractAddress, _identifier));
    return QRCodeHash;
  }
  bool not_called_re_ent27 = true;
  function bug_re_ent27() public {
    require(not_called_re_ent27);
    if (!(msg.sender.send(1 ether))) {
      revert();
    }
    not_called_re_ent27 = false;
  }
  function getQRCode(address dappBoxOrigin, string memory fileHash, string memory filePathHash) public view returns (bytes32) {
    uint256 len = fileExistenceProofs[dappBoxOrigin].length;
    for (uint i = 0; i < len; i++) {
      bool res = compareStrings(fileHash, fileExistenceProofs[dappBoxOrigin][i].fileHash) && compareStrings(filePathHash, fileExistenceProofs[dappBoxOrigin][i].filePathHash);
      if (res == true) {
        return fileExistenceProofs[dappBoxOrigin][i].QRCodeHash;
      }
    }
  }
  mapping(address => uint) balances_re_ent31;
  function withdrawFunds_re_ent31(uint256 _weiToWithdraw) public {
    require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
    require(msg.sender.send(_weiToWithdraw));
    balances_re_ent31[msg.sender] -= _weiToWithdraw;
  }
  function searchExistenceProoUsngQRf(address dappBoxOrigin, bytes32 QRCodeHash) public view returns (uint256, address, address, BlockchainIdentification, bytes32) {
    uint256 len = fileExistenceProofs[dappBoxOrigin].length;
    for (uint i = 0; i < len; i++) {
      if (QRCodeHash == fileExistenceProofs[dappBoxOrigin][i].QRCodeHash) {
        return (fileExistenceProofs[dappBoxOrigin][i].date, fileExistenceProofs[dappBoxOrigin][i].filesender, fileExistenceProofs[dappBoxOrigin][i].contractAddress, fileExistenceProofs[dappBoxOrigin][i].identifier, fileExistenceProofs[dappBoxOrigin][i].QRCodeHash);
      }
    }
  }
  bool not_called_re_ent13 = true;
  function bug_re_ent13() public {
    require(not_called_re_ent13);
    (bool success, ) = msg.sender.call.value(1 ether)("");
    if (!success) {
      revert();
    }
    not_called_re_ent13 = false;
  }
}
