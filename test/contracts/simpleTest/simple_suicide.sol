/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/unprotected_critical_functions/simple_suicide.sol
 * @author: -
 * @vulnerable_at_lines: 12,13
 */

//added prgma version
pragma solidity ^0.5.12;

contract SimpleSuicide {
  // <yes> <report> ACCESS_CONTROL
  //RPuc
  function sudicideAnyone() {
    selfdestruct(msg.sender);
  }

}
