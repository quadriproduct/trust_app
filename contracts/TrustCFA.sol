// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ISuperfluid} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol"; //"@superfluid-finance/ethereum-monorepo/packages/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";

import {IConstantFlowAgreementV1} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/agreements/IConstantFlowAgreementV1.sol";

import {CFAv1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/CFAv1Library.sol";

contract TrustCFA {
    using CFAv1Library for CFAv1Library.InitData;

    //initialize cfaV1 variable
    CFAv1Library.InitData public cfaV1;

    constructor(ISuperfluid host) {
        //initialize InitData struct, and set equal to cfaV1
        cfaV1 = CFAv1Library.InitData(
            host,
            //here, we are deriving the address of the CFA using the host contract
            IConstantFlowAgreementV1(
                address(
                    host.getAgreementClass(
                        keccak256(
                            "org.superfluid-finance.agreements.ConstantFlowAgreement.v1"
                        )
                    )
                )
            )
        );
    }

    function _createFlow(
        address token,
        address to,
        int96 flowRate_
    ) internal {
        //cfaV1.createFlow(to, token, flowRate_);
    }

    function _updateFlow(
        address token,
        address to,
        int96 flowRate_
    ) private {
        //cfaV1.updateFlow(to, token, flowRate_);
    }
}