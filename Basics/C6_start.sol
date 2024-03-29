pragma solidity ^0.5.11;

contract HelloWorld {

  uint yourFavoriteNumber; 
	address payable ownerAddress;

  constructor() public {
    ownerAddress = msg.sender;
  }
  
  modifier needsMoney(uint cost) {
    require(msg.value >= cost, "Not enough money attached to function");
    _;
  }
  function setYourFavoriteNumber(uint a) public payable needsMoney(1 ether) {
    yourFavoriteNumber = a; 
  }
  
  function balanceOfThisContract() public view returns (uint) {
    //this is how you get the balance of a contract
    return address(this).balance; 
  }
  
  //Secure now
  function withdraw() public {
    require(msg.sender == ownerAddress, "Don't try to touch my money!");
    (msg.sender).transfer(balanceOfThisContract());
  }
}
