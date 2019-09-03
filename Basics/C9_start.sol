pragma solidity ^0.5.11;

contract HelloWorld {

  struct UserInfo {
    uint favoriteNumber;
    uint moneySent;
  }
  
  mapping(address => UserInfo) public userInfoTable; 
  address payable ownerAddress;

  constructor() public {
    ownerAddress = msg.sender;
  }
  
  modifier needsMoney(uint cost) {
    require(msg.value >= cost, "Not enough money attached to function");
    _;
  }
  
  modifier onlyOwner() {
    require(msg.sender == ownerAddress, "Must be contract owner to call this function");
    _;
  }
  
  function setYourFavoriteNumber(uint a) public payable needsMoney(1 ether) {
    userInfoTable[msg.sender].favoriteNumber = a;
    userInfoTable[msg.sender].moneySent += msg.value;
  }
  
  function balanceOfThisContract() public view returns (uint) {
    return address(this).balance; 
  }
  
  function withdraw() public onlyOwner() {
    (msg.sender).transfer(balanceOfThisContract());
  }
  
  //make these functions
  function numberOfUsers() public view returns (uint) {
      
  }
  
  function deleteUserData() public {
    /*
      a user should be able to delete their own data (and no one elses)
      if they do this, numberOfUsers() should be subtracted by one
      HINT: you may need to modify the UserInfo struct to make this happen
      HINT 2: you will need to delete data from the middle of an array,
      and then remove the "gap". is there a way to do this without using 
      a for loop, if we don't care about preserving the order?
    */
  }
}
