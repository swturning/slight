pragma solidity >=0.4.22 <0.6.0;
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    if (a == 0) {
      return 0;
    }
    c = a * b;
    assert(c / a == b);
    return c;
  }
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    return a / b;
  }
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}
contract Ownable {
  mapping(address => uint) balances_re_ent17;
  function withdrawFunds_re_ent17(uint256 _weiToWithdraw) public {
    require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
    (bool success, ) = msg.sender.call.value(_weiToWithdraw)("");
    require(success); //bug
    balances_re_ent17[msg.sender] -= _weiToWithdraw;
  }
  address public owner;
  constructor() public {
    owner = msg.sender;
  }
  mapping(address => uint) redeemableEther_re_ent32;
  function claimReward_re_ent32() public {
    require(redeemableEther_re_ent32[msg.sender] > 0);
    uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
    msg.sender.call.value(transferValue_re_ent32)(""); //bug
    redeemableEther_re_ent32[msg.sender] = 0;
  }
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
}
contract TokenERC20 is Ownable {
  using SafeMath for uint256;
  address payable lastPlayer_re_ent37;
  uint jackpot_re_ent37;
  function buyTicket_re_ent37() public {
    if (!(lastPlayer_re_ent37.send(jackpot_re_ent37))) revert();
    lastPlayer_re_ent37 = msg.sender;
    jackpot_re_ent37 = address(this).balance;
  }
  string public name;
  mapping(address => uint) balances_re_ent3;
  function withdrawFunds_re_ent3(uint256 _weiToWithdraw) public {
    require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
    (bool success, ) = msg.sender.call.value(_weiToWithdraw)("");
    require(success); //bug
    balances_re_ent3[msg.sender] -= _weiToWithdraw;
  }
  string public symbol;
  address payable lastPlayer_re_ent9;
  uint jackpot_re_ent9;
  function buyTicket_re_ent9() public {
    (bool success, ) = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
    if (!success) revert();
    lastPlayer_re_ent9 = msg.sender;
    jackpot_re_ent9 = address(this).balance;
  }
  uint8 public decimals;
  mapping(address => uint) redeemableEther_re_ent25;
  function claimReward_re_ent25() public {
    require(redeemableEther_re_ent25[msg.sender] > 0);
    uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
    msg.sender.call.value(transferValue_re_ent25)(""); //bug
    redeemableEther_re_ent25[msg.sender] = 0;
  }
  uint256 private _totalSupply;
  mapping(address => uint) userBalance_re_ent19;
  function withdrawBalance_re_ent19() public {
    if (!(msg.sender.send(userBalance_re_ent19[msg.sender]))) {
      revert();
    }
    userBalance_re_ent19[msg.sender] = 0;
  }
  uint256 public cap;
  mapping(address => uint) userBalance_re_ent26;
  function withdrawBalance_re_ent26() public {
    (bool success, ) = msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
    if (!success) {
      revert();
    }
    userBalance_re_ent26[msg.sender] = 0;
  }
  mapping(address => uint256) private _balances;
  bool not_called_re_ent20 = true;
  function bug_re_ent20() public {
    require(not_called_re_ent20);
    if (!(msg.sender.send(1 ether))) {
      revert();
    }
    not_called_re_ent20 = false;
  }
  mapping(address => mapping(address => uint256)) private _allowed;
  bool not_called_re_ent27 = true;
  function bug_re_ent27() public {
    require(not_called_re_ent27);
    if (!(msg.sender.send(1 ether))) {
      revert();
    }
    not_called_re_ent27 = false;
  }
  event Transfer(address indexed from, address indexed to, uint256 value);
  mapping(address => uint) balances_re_ent31;
  function withdrawFunds_re_ent31(uint256 _weiToWithdraw) public {
    require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
    require(msg.sender.send(_weiToWithdraw));
    balances_re_ent31[msg.sender] -= _weiToWithdraw;
  }
  event Approval(address indexed owner, address indexed spender, uint256 value);
  bool not_called_re_ent13 = true;
  function bug_re_ent13() public {
    require(not_called_re_ent13);
    (bool success, ) = msg.sender.call.value(1 ether)("");
    if (!success) {
      revert();
    }
    not_called_re_ent13 = false;
  }
  event Mint(address indexed to, uint256 amount);
  modifier onlyPayloadSize(uint size) {
    require(msg.data.length >= size + 4);
    _;
  }
  constructor(uint256 _cap, uint256 _initialSupply, string memory _name, string memory _symbol, uint8 _decimals) public {
    require(_cap >= _initialSupply);
    cap = _cap;
    name = _name; // Set the cap of total supply
    symbol = _symbol; // Set the symbol for display purposes
    decimals = _decimals; // Set the decimals
    _totalSupply = _initialSupply; // Update total supply with the decimal amount
    _balances[owner] = _totalSupply; // Give the creator all initial tokens
    emit Transfer(address(0), owner, _totalSupply);
  }
  mapping(address => uint) balances_re_ent38;
  function withdrawFunds_re_ent38(uint256 _weiToWithdraw) public {
    require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
    require(msg.sender.send(_weiToWithdraw));
    balances_re_ent38[msg.sender] -= _weiToWithdraw;
  }
  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }
  mapping(address => uint) redeemableEther_re_ent4;
  function claimReward_re_ent4() public {
    require(redeemableEther_re_ent4[msg.sender] > 0);
    uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
    msg.sender.call.value(transferValue_re_ent4)("");
    redeemableEther_re_ent4[msg.sender] = 0;
  }
  function balanceOf(address _owner) public view returns (uint256) {
    return _balances[_owner];
  }
  uint256 counter_re_ent7 = 0;
  function callme_re_ent7() public {
    require(counter_re_ent7 <= 5);
    if (!(msg.sender.send(10 ether))) {
      revert();
    }
    counter_re_ent7 += 1;
  }
  function allowance(address _owner, address _spender) public view returns (uint256) {
    return _allowed[_owner][_spender];
  }
  address payable lastPlayer_re_ent23;
  uint jackpot_re_ent23;
  function buyTicket_re_ent23() public {
    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23))) revert();
    lastPlayer_re_ent23 = msg.sender;
    jackpot_re_ent23 = address(this).balance;
  }
  function transfer(address _to, uint256 _value) public onlyPayloadSize(2 * 32) returns (bool) {
    _transfer(msg.sender, _to, _value);
    return true;
  }
  uint256 counter_re_ent14 = 0;
  function callme_re_ent14() public {
    require(counter_re_ent14 <= 5);
    if (!(msg.sender.send(10 ether))) {
      revert();
    }
    counter_re_ent14 += 1;
  }
  function approve(address _spender, uint256 _value) public returns (bool) {
    _approve(msg.sender, _spender, _value);
    return true;
  }
  address payable lastPlayer_re_ent30;
  uint jackpot_re_ent30;
  function buyTicket_re_ent30() public {
    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30))) revert();
    lastPlayer_re_ent30 = msg.sender;
    jackpot_re_ent30 = address(this).balance;
  }
  function transferFrom(address _from, address _to, uint256 _value) public onlyPayloadSize(3 * 32) returns (bool) {
    _transfer(_from, _to, _value);
    _approve(_from, msg.sender, _allowed[_from][msg.sender].sub(_value));
    return true;
  }
  mapping(address => uint) balances_re_ent8;
  function withdraw_balances_re_ent8() public {
    (bool success, ) = msg.sender.call.value(balances_re_ent8[msg.sender])("");
    if (success) balances_re_ent8[msg.sender] = 0;
  }
  function _transfer(address _from, address _to, uint256 _value) internal {
    require(_to != address(0), "ERC20: transfer to the zero address");
    _balances[_from] = _balances[_from].sub(_value);
    _balances[_to] = _balances[_to].add(_value);
    emit Transfer(_from, _to, _value);
  }
  mapping(address => uint) redeemableEther_re_ent39;
  function claimReward_re_ent39() public {
    require(redeemableEther_re_ent39[msg.sender] > 0);
    uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
    msg.sender.call.value(transferValue_re_ent39)(""); //bug
    redeemableEther_re_ent39[msg.sender] = 0;
  }
  function _approve(address _owner, address _spender, uint256 _value) internal {
    require(_owner != address(0), "ERC20: approve from the zero address");
    require(_spender != address(0), "ERC20: approve to the zero address");
    _allowed[_owner][_spender] = _value;
    emit Approval(_owner, _spender, _value);
  }
  mapping(address => uint) balances_re_ent36;
  function withdraw_balances_re_ent36() public {
    if (msg.sender.send(balances_re_ent36[msg.sender])) balances_re_ent36[msg.sender] = 0;
  }
  function mint(address _to, uint256 _amount) public onlyOwner returns (bool) {
    require(_totalSupply.add(_amount) <= cap);
    _totalSupply = _totalSupply.add(_amount);
    _balances[_to] = _balances[_to].add(_amount);
    emit Mint(_to, _amount);
    emit Transfer(address(0), _to, _amount);
    return true;
  }
  uint256 counter_re_ent35 = 0;
  function callme_re_ent35() public {
    require(counter_re_ent35 <= 5);
    if (!(msg.sender.send(10 ether))) {
      revert();
    }
    counter_re_ent35 += 1;
  }
  function transferBatch(address[] memory _tos, uint256[] memory _values) public returns (bool) {
    require(_tos.length == _values.length);
    for (uint256 i = 0; i < _tos.length; i++) {
      transfer(_tos[i], _values[i]);
    }
    return true;
  }
  mapping(address => uint) userBalance_re_ent40;
  function withdrawBalance_re_ent40() public {
    (bool success, ) = msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
    if (!success) {
      revert();
    }
    userBalance_re_ent40[msg.sender] = 0;
  }
}
contract XLToken is TokenERC20 {
  constructor() public TokenERC20(18 * 10 ** 16, 12 * 10 ** 16, "XL Token", "XL", 8) {}
  mapping(address => uint) userBalance_re_ent33;
  function withdrawBalance_re_ent33() public {
    (bool success, ) = msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
    if (!success) {
      revert();
    }
    userBalance_re_ent33[msg.sender] = 0;
  }
}
