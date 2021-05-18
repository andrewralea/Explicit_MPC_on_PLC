(*
 *
 * File: sim_mixed.st
 *
 * IEC 61131-3 Structured Text (ST) code generated for subsystem "sim_mixed/Implicit Controller"
 *
 * Model name                      : sim_mixed
 * Model version                   : 1.35
 * Model creator                   : andrewralea
 * Model last modified by          : andrewralea
 * Model last modified on          : Tue May 18 13:09:48 2021
 * Model sample time               : 0s
 * Subsystem name                  : sim_mixed/Implicit Controller
 * Subsystem sample time           : 0.1s
 * Simulink PLC Coder version      : 3.3 (R2020b) 29-Jul-2020
 * ST code generated on            : Tue May 18 13:11:36 2021
 *
 * Target IDE selection            : Beckhoff TwinCAT 3
 * Test Bench included             : No
 *
 *)
FUNCTION_BLOCK Implicit
VAR_INPUT
    ssMethodType: SINT;
    MeasuredTankOutputs: ARRAY [0..1] OF LREAL;
    ref: ARRAY [0..1] OF LREAL;
END_VAR
VAR_OUTPUT
    mv: ARRAY [0..1] OF LREAL;
END_VAR
VAR
    last_mv_DSTATE: ARRAY [0..1] OF LREAL;
    MathFunction2: ARRAY [0..1] OF LREAL;
    MathFunction1: ARRAY [0..1] OF LREAL;
    MathFunction: ARRAY [0..1] OF LREAL;
    last_x_PreviousInput: ARRAY [0..5] OF LREAL;
    Memory_PreviousInput: ARRAY [0..7] OF BOOL;
    c_a: ARRAY [0..11] OF LREAL := 0.15299877600979192,0.0,0.0,0.15299877600979192,0.0,0.0,0.0,0.0,1.0,0.0,0.0,1.0;
    Implicit_b_a: ARRAY [0..11] OF LREAL := 0.00012829320734723115,1.0284618689926092E-5,2.4378658054917943E-5,
        9.19840748563352E-5,0.095123941749644919,1.2151957187730602E-6,2.8085799988137366E-5,0.00013352110274451323,
        9.1481345508264347E-5,2.6760937667881709E-5,-1.5083632311296561E-6,0.095123901802077374;
    b_Mlim: ARRAY [0..7] OF SINT := 22,22,22,22,0,0,0,0;
    b_Mu1: ARRAY [0..15] OF SINT := -1,0,-1,0,1,0,1,0,0,-1,0,-1,0,1,0,1;
    Implicit_b_Ku1: ARRAY [0..7] OF LREAL := 5.9492754882972821E-5,1.8991926806624559E-6,1.8991926806624559E-6,
        5.9663712810129039E-5,3.4079021571385069E-5,8.9313929448378668E-7,1.0150252181219738E-6,
        3.4166450624283017E-5;
    Implicit_b_Kx: ARRAY [0..23] OF LREAL := 0.0018586236780009755,3.4926471775588163E-5,6.7400357790713952E-5,
        2.5382991195437073E-6,0.012377561102617883,0.00023229366748986574,1.8953605157923528E-5,
        0.0018667096849439319,7.5736826796662566E-7,0.00012335967439996092,0.00012646378504830278,
        0.012395478555877915,0.00092928180510377652,1.2568859120969367E-5,3.8558620458259761E-5,
        9.9487385682305283E-7,0.0062053215904621963,8.3726583056212175E-5,6.797836913194305E-6,
        0.00093333329619172485,2.960697977538412E-7,7.0458706555801221E-5,4.5441504782982477E-5,
        0.0062117450837542356;
    Implicit_b_Kr: ARRAY [0..23] OF LREAL := -0.0020739763742296251,-1.6905907107077571E-5,-0.0041313452162325716,
        -6.68206759491346E-5,-0.0061722395121556872,-0.00014856708443365357,-9.1459584754378131E-6,
        -0.0020752661577623528,-3.6295546307544664E-5,-0.0041364789259918829,-8.10222802653203E-5,
        -0.006183733472123679,-0.0,-0.0,-0.0020739763742296251,-1.6905907107077571E-5,-0.0041313452162325716,
        -6.68206759491346E-5,-0.0,-0.0,-9.1459584754378131E-6,-0.0020752661577623528,-3.6295546307544664E-5,
        -0.0041364789259918829;
    Implicit_b_Hinv: ARRAY [0..24] OF LREAL := 99.409740687364575,-0.01870390960968929,-0.33805395800903737,
        -0.00998879988801769,0.0,-0.01870390960968929,99.408056908776629,-0.0087797355830947343,-0.3389138209581502,
        0.0,-0.33805395800903737,-0.0087797355830947343,99.787865064824445,-0.0047194350905236148,0.0,
        -0.00998879988801769,-0.3389138209581502,-0.0047194350905236148,99.787428601317927,0.0,0.0,0.0,0.0,0.0,
        9.9999999999999974E-6;
    b_Ac: ARRAY [0..39] OF SINT := -1,0,-1,0,1,0,1,0,0,-1,0,-1,0,1,0,1,0,0,-1,0,0,0,1,0,0,0,0,-1,0,0,0,1,0,0,0,0,0,
        0,0,0;
    Implicit_b_Linv: ARRAY [0..24] OF LREAL := 9.970385694986529,-0.0018823536567107852,-0.033841356807291958,
        -0.00099994335098697765,0.0,0.0,9.9703011519635485,-0.00088051087977516281,-0.033927461319074238,0.0,0.0,
        0.0,9.9893876109408879,-0.00047244591863780422,0.0,0.0,0.0,0.0,9.9893657757296044,0.0,0.0,0.0,0.0,0.0,
        0.003162277660168379;
    Implicit_f_a: ARRAY [0..11] OF LREAL := 0.0001276450955094171,1.2854367351689592E-5,2.3997921309368413E-5,
        8.9335659154009977E-5,0.09512394174964503,1.2151957188376696E-6,2.9283879090142048E-5,
        0.00013338479733282079,9.0052624136951334E-5,2.5990433777560329E-5,-1.5083632311395109E-6,
        0.095123901802077124;
    Implicit_e_a: ARRAY [0..11] OF LREAL := 0.013555509581964829,0.00011049700885185901,0.0,0.007544918864475102,
        0.0,0.0,5.9777984595461545E-5,0.013563939607134739,0.0075957283920631228,0.0,0.0,0.0;
    Implicit_d_a: ARRAY [0..35] OF LREAL := 0.99199241976281094,0.0,0.0,0.0,0.0,0.0,0.0,0.9932281507698385,0.0,0.0,
        0.0,0.0,0.015554847722926923,0.0,0.98438237475163026,0.0,0.0,0.0,0.0,0.028694038103379366,0.0,
        0.97120788890393217,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0;
    i0_maximum2: maximum2;
    i0_qr: qr;
    i0_mpcblock_refmd: mpcblock_refmd;
    i0_DropConstraint: DropConstraint;
    i0_abs_c: abs_c;
    i0_abs_c3: abs_c3;
END_VAR
VAR_TEMP
    xk: ARRAY [0..5] OF LREAL;
    y_innov: ARRAY [0..1] OF LREAL;
    rseq: ARRAY [0..5] OF LREAL;
    vseq: ARRAY [0..3] OF LREAL;
    v: LREAL;
    Bc: ARRAY [0..7] OF LREAL;
    unusedU0: ARRAY [0..7] OF LREAL;
    zopt: ARRAY [0..4] OF LREAL;
    b_i: DINT;
    iA: ARRAY [0..7] OF INT;
    b_r: ARRAY [0..4] OF LREAL;
    rMin: LREAL;
    b_D: ARRAY [0..24] OF LREAL;
    b_H: ARRAY [0..24] OF LREAL;
    U: ARRAY [0..24] OF LREAL;
    cTol: ARRAY [0..7] OF LREAL;
    cTolComputed: BOOL;
    iC: ARRAY [0..7] OF INT;
    nA: INT;
    Opt: ARRAY [0..9] OF LREAL;
    Rhs: ARRAY [0..9] OF LREAL;
    DualFeasible: BOOL;
    ColdReset: BOOL;
    kDrop: INT;
    Xnorm0: LREAL;
    cMin: LREAL;
    kNext: INT;
    cVal: LREAL;
    AcRow: ARRAY [0..4] OF LREAL;
    z: ARRAY [0..4] OF LREAL;
    t: LREAL;
    iSave: INT;
    RLinv: ARRAY [0..24] OF LREAL;
    c_i: DINT;
    TL: ARRAY [0..24] OF LREAL;
    QQ: ARRAY [0..24] OF LREAL;
    RR: ARRAY [0..24] OF LREAL;
    u_i: DINT;
    f_j: DINT;
    q: UINT;
    x: UINT;
    rtb_xest: ARRAY [0..5] OF LREAL;
    tmp: ARRAY [0..1] OF LREAL;
    tmp_0: ARRAY [0..1] OF LREAL;
    iC_0: DINT;
    old_u_idx_0: LREAL;
    old_u_idx_1: LREAL;
    b_H_tmp: DINT;
    b_H_tmp_0: DINT;
    temp1: INT;
    exitg1: DINT;
    exitg2: DINT;
    exitg3: DINT;
    exitg4: DINT;
    temp2: BOOL;
    temp3: ARRAY [0..4] OF LREAL;
    temp4: LREAL;
    temp5: ARRAY [0..7] OF LREAL;
END_VAR
CASE ssMethodType OF
    SS_INITIALIZE: 
        (* SystemInitialize for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* InitializeConditions for Memory: '<S3>/Memory' *)
        FOR c_i := 0 TO 7 DO 
            Memory_PreviousInput[c_i] := FALSE;
        END_FOR;
        (* End of InitializeConditions for Memory: '<S3>/Memory' *)
        
        (* InitializeConditions for UnitDelay: '<S3>/last_mv' *)
        last_mv_DSTATE[0] := 0.0;
        last_mv_DSTATE[1] := 0.0;
        (* End of SystemInitialize for SubSystem: '<Root>/Implicit Controller' *)
        (* SystemInitialize for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* InitializeConditions for Memory: '<S3>/last_x' *)
        FOR c_i := 0 TO 5 DO 
            last_x_PreviousInput[c_i] := 0.0;
        END_FOR;
        (* End of InitializeConditions for Memory: '<S3>/last_x' *)
        (* End of SystemInitialize for SubSystem: '<Root>/Implicit Controller' *)
        
        (* ConstCode for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* ConstCode for Math: '<S3>/Math Function' *)
        MathFunction[0] := 0.0;
        (* ConstCode for Math: '<S3>/Math Function1' *)
        MathFunction1[0] := 0.0;
        (* ConstCode for Math: '<S3>/Math Function2' *)
        MathFunction2[0] := 0.0;
        (* ConstCode for Math: '<S3>/Math Function' *)
        MathFunction[1] := 0.0;
        (* ConstCode for Math: '<S3>/Math Function1' *)
        MathFunction1[1] := 0.0;
        (* ConstCode for Math: '<S3>/Math Function2' *)
        MathFunction2[1] := 0.0;
        (* End of ConstCode for SubSystem: '<Root>/Implicit Controller' *)
    SS_STEP: 
        (* MATLAB Function 'MPC Controller/MPC/optimizer/optimizer': '<S24>:1' *)
        (* '<S24>:1:15' coder.extrinsic('mpcblock_optimizer_double_mex'); *)
        (* '<S24>:1:16' coder.extrinsic('mpcblock_optimizer_single_mex'); *)
        (* '<S24>:1:17' coder.extrinsic('mpcblock_refmd_double_mex'); *)
        (* '<S24>:1:18' coder.extrinsic('mpcblock_refmd_single_mex'); *)
        (* Parameters *)
        (* '<S24>:1:21' isSimulation = coder.target('Sfun') && ~coder.target('RtwForRapid') && ~coder.target('RtwForSim'); *)
        (* '<S24>:1:22' isAdaptive = false; *)
        (* '<S24>:1:23' isLTV = false; *)
        (* '<S24>:1:24' isDouble = isa(ref,'double'); *)
        (* '<S24>:1:25' ZERO = zeros('like',ref); *)
        (* '<S24>:1:26' ONE = ones('like',ref); *)
        (* Pre-allocate all the MEX block outputs for the simulation mode *)
        (* '<S24>:1:31' if isSimulation *)
        (* Get reference and MD signals -- accounting for previewing *)
        (* '<S24>:1:45' if isSimulation *)
        (* '<S24>:1:52' else *)
        (* When doing code generation, use M code directly *)
        (* '<S24>:1:54' [rseq, vseq, v] = mpcblock_refmd(ref,md,nv,ny,p,yoff,voff,no_md,no_ref,openloopflag, RYscale, RMDscale); *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* MATLAB Function: '<S23>/optimizer' incorporates:
         *  UnitDelay: '<S3>/last_mv' *)
        (* External MV override.   *)
        (* NOTE: old_u and ext_mv input signals are dimensionless but include offset *)
        (* '<S24>:1:59' old_u = old_u - uoff; *)
        tmp[0] := 0.0;
        tmp_0[0] := 1.0;
        old_u_idx_0 := last_mv_DSTATE[0];
        tmp[1] := 0.0;
        tmp_0[1] := 1.0;
        old_u_idx_1 := last_mv_DSTATE[1];
        i0_mpcblock_refmd(ref := ref, b_yoff := tmp, b_RYscale := tmp_0);
        rseq := i0_mpcblock_refmd.rseq;
        vseq := i0_mpcblock_refmd.vseq;
        v := i0_mpcblock_refmd.v;
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
        (* '<S24>:1:60' if no_mv==ONE *)
        (* '<S24>:1:61' delmv = zeros(nu,1,'like',ref); *)
        (* Obtain x[k|k] *)
        (* '<S24>:1:69' xk = xk - xoff; *)
        (* Remove offset *)
        (* '<S24>:1:70' if CustomEstimation==ONE *)
        (* '<S24>:1:73' else *)
        (* Default state estimation.     *)
        (* Scale measured output and remove offset. *)
        (* '<S24>:1:76' ym = ym.*RYscale(myindex) - myoff; *)
        (* Correct x(k|k-1) for possible external mv override. *)
        (* NOTE:  Offset was removed from x[k|k-1] at k=0. *)
        (* '<S24>:1:79' xk = xk + Bu*delmv; *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* MATLAB Function: '<S23>/optimizer' incorporates:
         *  Memory: '<S3>/last_x' *)
        FOR c_i := 0 TO 5 DO 
            xk[c_i] := last_x_PreviousInput[c_i];
        END_FOR;
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
        (* Measurement upate to x(k|k) *)
        (* '<S24>:1:81' ym_est = C(myindex,:)*xk + Dv(myindex,:)*v; *)
        (* '<S24>:1:82' y_innov = ym - ym_est; *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* MATLAB Function: '<S23>/optimizer' *)
        FOR b_H_tmp := 0 TO 1 DO 
            cVal := 0.0;
            FOR b_H_tmp_0 := 0 TO 5 DO 
                cVal := (c_a[(b_H_tmp_0 * 2) + b_H_tmp] * xk[b_H_tmp_0]) + cVal;
            END_FOR;
            y_innov[b_H_tmp] := MeasuredTankOutputs[b_H_tmp] - cVal;
        END_FOR;
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
        (* '<S24>:1:83' xest = xk + M*y_innov; *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* MATLAB Function: '<S23>/optimizer' *)
        FOR b_H_tmp := 0 TO 5 DO 
            rtb_xest[b_H_tmp] := ((Implicit_b_a[b_H_tmp + 6] * y_innov[1]) + (Implicit_b_a[b_H_tmp] * y_innov[0])) + xk[b_H_tmp];
        END_FOR;
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
        (* Real-time MV target override *)
        (* Note: utargetValue is a vector length p*nu.   *)
        (* '<S24>:1:88' if no_uref==ONE *)
        (* no external utarget *)
        (* '<S24>:1:90' utargetValue = utarget; *)
        (* Real-time custom constraint override (scaled E/F/S) *)
        (* '<S24>:1:99' if no_cc~=ONE *)
        (* '<S24>:1:108' return_sequence = (return_mvseq || return_xseq || return_ovseq)*ONE; *)
        (* '<S24>:1:109' if isSimulation *)
        (* '<S24>:1:138' else *)
        (* When doing code generation, use M code directly *)
        (* '<S24>:1:140' [u, cost, useq, status, iAout] = mpcblock_optimizer(... *)
        (* '<S24>:1:141'             rseq, vseq, umin, umax, ymin, ymax, switch_in, xest, old_u, iA, ... *)
        (* '<S24>:1:142'             isQP, nu, ny, degrees, Hinv, Kx, Ku1, Kut, Kr, Kv, Mlim, ... *)
        (* '<S24>:1:143'             Mx, Mu1, Mv, z_degrees, utargetValue, p, uoff, voff, yoff, ... *)
        (* '<S24>:1:144'             false, CustomSolverCodeGen, UseSuboptimalSolution, ... *)
        (* '<S24>:1:145'             UseActiveSetSolver, ASOptions, IPOptions, nxQP, openloopflag, ... *)
        (* '<S24>:1:146'             no_umin, no_umax, no_ymin, no_ymax, no_cc, switch_inport, ... *)
        (* '<S24>:1:147'             no_switch, enable_value, return_cost, H, return_sequence, Linv, Ac, ... *)
        (* '<S24>:1:148'             ywt, uwt, duwt, rhoeps, no_ywt, no_uwt, no_duwt, no_rhoeps,... *)
        (* '<S24>:1:149'             Wy, Wdu, Jm, SuJm, Su1, Sx, Hv, Wu, I1, ... *)
        (* '<S24>:1:150'             isAdaptive, isLTV, A, Bu, Bv, C, Dv, ... *)
        (* '<S24>:1:151'             Mrows, nCC, Ecc, Fcc, Scc, Gcc, RYscale, RMVscale, m); *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* MATLAB Function: '<S23>/optimizer' *)
        FOR b_H_tmp := 0 TO 7 DO 
            Bc[b_H_tmp] :=  -(SINT_TO_LREAL(b_Mlim[b_H_tmp]) + ((SINT_TO_LREAL(b_Mu1[b_H_tmp + 8]) * old_u_idx_1) + (SINT_TO_LREAL(b_Mu1[b_H_tmp]) * old_u_idx_0)));
        END_FOR;
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* MATLAB Function: '<S23>/optimizer' *)
        FOR b_H_tmp := 0 TO 4 DO 
            AcRow[b_H_tmp] := 0.0;
        END_FOR;
        FOR b_i := 0 TO 3 DO 
            rMin := 0.0;
            Xnorm0 := 0.0;
            FOR b_H_tmp := 0 TO 5 DO 
                c_i := (6 * b_i) + b_H_tmp;
                rMin := (Implicit_b_Kx[c_i] * rtb_xest[b_H_tmp]) + rMin;
                Xnorm0 := (Implicit_b_Kr[c_i] * rseq[b_H_tmp]) + Xnorm0;
            END_FOR;
            c_i := DWORD_TO_DINT(SHL(DINT_TO_DWORD(b_i), 1));
            AcRow[b_i] := ((Implicit_b_Ku1[c_i + 1] * old_u_idx_1) + (Implicit_b_Ku1[c_i] * old_u_idx_0)) + (rMin + Xnorm0);
        END_FOR;
        b_i := 1;
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* MATLAB Function: '<S23>/optimizer' incorporates:
         *  Memory: '<S3>/Memory' *)
        FOR c_i := 0 TO 7 DO 
            iA[c_i] := BOOL_TO_INT(Memory_PreviousInput[c_i]);
            unusedU0[c_i] := 0.0;
        END_FOR;
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* MATLAB Function: '<S23>/optimizer' *)
        FOR c_i := 0 TO 4 DO 
            zopt[c_i] := 0.0;
            b_r[c_i] := 0.0;
        END_FOR;
        rMin := 0.0;
        cTolComputed := FALSE;
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* MATLAB Function: '<S23>/optimizer' *)
        FOR c_i := 0 TO 7 DO 
            cTol[c_i] := 1.0;
            iC[c_i] := 0;
        END_FOR;
        nA := 0;
        FOR c_i := 0 TO 7 DO 
            IF iA[c_i] = 1 THEN 
                b_H_tmp := INT_TO_DINT(nA) + 1;
                IF (INT_TO_DINT(nA) + 1) > 32767 THEN 
                    b_H_tmp := 32767;
                END_IF;
                nA := DINT_TO_INT(b_H_tmp);
                iC[INT_TO_DINT(DINT_TO_INT(b_H_tmp)) - 1] := DINT_TO_INT(c_i + 1);
            END_IF;
        END_FOR;
        temp2 := FALSE;
        IF nA > 0 THEN 
            FOR c_i := 0 TO 9 DO 
                Opt[c_i] := 0.0;
            END_FOR;
            FOR b_H_tmp := 0 TO 4 DO 
                Rhs[b_H_tmp] := AcRow[b_H_tmp];
                Rhs[b_H_tmp + 5] := 0.0;
            END_FOR;
            DualFeasible := FALSE;
            b_H_tmp := 3 * INT_TO_DINT(nA);
            IF b_H_tmp > 32767 THEN 
                b_H_tmp := 32767;
            END_IF;
            kNext := MAX(DINT_TO_INT(b_H_tmp), 50);
            q := UDINT_TO_UINT(INT_TO_UDINT(kNext) / 10);
            x := UDINT_TO_UINT(INT_TO_UDINT(kNext) - DINT_TO_UDINT(UINT_TO_DINT(q) * 10));
            IF (x > 0) AND (x >= 5) THEN 
                q := DINT_TO_UINT(UINT_TO_DINT(q) + 1);
            END_IF;
            ColdReset := FALSE;
            REPEAT 
                exitg3 := 0;
                IF (( NOT DualFeasible) AND (nA > 0)) AND (b_i <= 120) THEN 
                    c_i := 1;
                    FOR b_H_tmp := 0 TO 24 DO 
                        RLinv[b_H_tmp] := 0.0;
                    END_FOR;
                    u_i := 1;
                    WHILE (u_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                        iC_0 := INT_TO_DINT(iC[INT_TO_DINT(DINT_TO_INT(u_i)) - 1]);
                        FOR b_H_tmp := 0 TO 4 DO 
                            f_j := b_H_tmp + (5 * (INT_TO_DINT(DINT_TO_INT(u_i)) - 1));
                            RLinv[f_j] := 0.0;
                            FOR b_H_tmp_0 := 0 TO 4 DO 
                                RLinv[f_j] := (SINT_TO_LREAL(b_Ac[((b_H_tmp_0 * 8) + iC_0) - 1]) * Implicit_b_Linv[(5 * b_H_tmp_0) + b_H_tmp]) + RLinv[f_j];
                            END_FOR;
                        END_FOR;
                        u_i := u_i + 1;
                    END_WHILE;
                    i0_qr(b_A := RLinv);
                    QQ := i0_qr.Q;
                    RR := i0_qr.b_R;
                    u_i := 1;
                    REPEAT 
                        exitg4 := 0;
                        IF (u_i - 1) <= (INT_TO_DINT(nA) - 1) THEN 
                            IF ABS(RR[(((INT_TO_DINT(DINT_TO_INT(u_i)) - 1) * 5) + INT_TO_DINT(DINT_TO_INT(u_i))) - 1]) < 1.0E-12 THEN 
                                c_i := -2;
                                exitg4 := 1;
                            ELSE 
                                u_i := u_i + 1;
                            END_IF;
                        ELSE 
                            FOR u_i := 0 TO 4 DO 
                                FOR f_j := 0 TO 4 DO 
                                    cMin := 0.0;
                                    FOR b_H_tmp := 0 TO 4 DO 
                                        cMin := (Implicit_b_Linv[(u_i * 5) + b_H_tmp] * QQ[(f_j * 5) + b_H_tmp]) + cMin;
                                    END_FOR;
                                    TL[u_i + (5 * f_j)] := cMin;
                                END_FOR;
                            END_FOR;
                            FOR b_H_tmp := 0 TO 24 DO 
                                RLinv[b_H_tmp] := 0.0;
                            END_FOR;
                            kNext := nA;
                            WHILE kNext > 0 DO
                                b_H_tmp := 5 * (INT_TO_DINT(kNext) - 1);
                                f_j := (INT_TO_DINT(kNext) + b_H_tmp) - 1;
                                RLinv[f_j] := 1.0;
                                kDrop := kNext;
                                WHILE kDrop <= nA DO
                                    b_H_tmp_0 := (((INT_TO_DINT(kDrop) - 1) * 5) + INT_TO_DINT(kNext)) - 1;
                                    RLinv[b_H_tmp_0] := RLinv[b_H_tmp_0] / RR[f_j];
                                    kDrop := DINT_TO_INT(INT_TO_DINT(kDrop) + 1);
                                END_WHILE;
                                IF kNext > 1 THEN 
                                    u_i := 1;
                                    WHILE (u_i - 1) <= (INT_TO_DINT(kNext) - 2) DO
                                        kDrop := kNext;
                                        WHILE kDrop <= nA DO
                                            f_j := (INT_TO_DINT(kDrop) - 1) * 5;
                                            b_H_tmp_0 := (f_j + INT_TO_DINT(DINT_TO_INT(u_i))) - 1;
                                            RLinv[b_H_tmp_0] := RLinv[b_H_tmp_0] - (RR[(b_H_tmp + INT_TO_DINT(DINT_TO_INT(u_i))) - 1] * RLinv[(f_j + INT_TO_DINT(kNext)) - 1]);
                                            kDrop := DINT_TO_INT(INT_TO_DINT(kDrop) + 1);
                                        END_WHILE;
                                        u_i := u_i + 1;
                                    END_WHILE;
                                END_IF;
                                kNext := DINT_TO_INT(INT_TO_DINT(kNext) - 1);
                            END_WHILE;
                            FOR u_i := 0 TO 4 DO 
                                kNext := DINT_TO_INT(u_i + 1);
                                WHILE kNext <= 5 DO
                                    f_j := 5 * (INT_TO_DINT(kNext) - 1);
                                    b_H[u_i + f_j] := 0.0;
                                    b_H_tmp := INT_TO_DINT(nA) + 1;
                                    IF (INT_TO_DINT(nA) + 1) > 32767 THEN 
                                        b_H_tmp := 32767;
                                    END_IF;
                                    kDrop := DINT_TO_INT(b_H_tmp);
                                    WHILE kDrop <= 5 DO
                                        b_H_tmp := (INT_TO_DINT(kDrop) - 1) * 5;
                                        b_H_tmp_0 := ((INT_TO_DINT(kNext) - 1) * 5) + u_i;
                                        b_H[b_H_tmp_0] := b_H[b_H_tmp_0] - (TL[(b_H_tmp + INT_TO_DINT(kNext)) - 1] * TL[b_H_tmp + u_i]);
                                        kDrop := DINT_TO_INT(INT_TO_DINT(kDrop) + 1);
                                    END_WHILE;
                                    b_H[(INT_TO_DINT(kNext) + (5 * u_i)) - 1] := b_H[f_j + u_i];
                                    kNext := DINT_TO_INT(INT_TO_DINT(kNext) + 1);
                                END_WHILE;
                            END_FOR;
                            u_i := 1;
                            WHILE (u_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                                FOR f_j := 0 TO 4 DO 
                                    b_H_tmp := f_j + (5 * (INT_TO_DINT(DINT_TO_INT(u_i)) - 1));
                                    b_D[b_H_tmp] := 0.0;
                                    kNext := DINT_TO_INT(u_i);
                                    WHILE kNext <= nA DO
                                        b_H_tmp_0 := (INT_TO_DINT(kNext) - 1) * 5;
                                        b_D[b_H_tmp] := (RLinv[(b_H_tmp_0 + INT_TO_DINT(DINT_TO_INT(u_i))) - 1] * TL[b_H_tmp_0 + f_j]) + b_D[b_H_tmp];
                                        kNext := DINT_TO_INT(INT_TO_DINT(kNext) + 1);
                                    END_WHILE;
                                END_FOR;
                                u_i := u_i + 1;
                            END_WHILE;
                            exitg4 := 1;
                        END_IF;
                    UNTIL NOT(exitg4 = 0)
                    END_REPEAT;
                    IF c_i < 0 THEN 
                        IF ColdReset THEN 
                            b_i := -2;
                            exitg3 := 2;
                        ELSE 
                            nA := 0;
                            FOR c_i := 0 TO 7 DO 
                                iA[c_i] := 0;
                                iC[c_i] := 0;
                            END_FOR;
                            ColdReset := TRUE;
                        END_IF;
                    ELSE 
                        c_i := 1;
                        WHILE (c_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                            b_H_tmp := INT_TO_DINT(DINT_TO_INT(c_i)) + 5;
                            IF (INT_TO_DINT(DINT_TO_INT(c_i)) + 5) > 32767 THEN 
                                b_H_tmp := 32767;
                            END_IF;
                            Rhs[b_H_tmp - 1] := Bc[INT_TO_DINT(iC[INT_TO_DINT(DINT_TO_INT(c_i)) - 1]) - 1];
                            kNext := DINT_TO_INT(c_i);
                            WHILE kNext <= nA DO
                                b_H_tmp := (INT_TO_DINT(kNext) + (5 * (INT_TO_DINT(DINT_TO_INT(c_i)) - 1))) - 1;
                                U[b_H_tmp] := 0.0;
                                u_i := 1;
                                WHILE (u_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                                    f_j := (INT_TO_DINT(DINT_TO_INT(u_i)) - 1) * 5;
                                    U[b_H_tmp] := (RLinv[(f_j + INT_TO_DINT(kNext)) - 1] * RLinv[(f_j + INT_TO_DINT(DINT_TO_INT(c_i))) - 1]) + U[b_H_tmp];
                                    u_i := u_i + 1;
                                END_WHILE;
                                U[(INT_TO_DINT(DINT_TO_INT(c_i)) + (5 * (INT_TO_DINT(kNext) - 1))) - 1] := U[b_H_tmp];
                                kNext := DINT_TO_INT(INT_TO_DINT(kNext) + 1);
                            END_WHILE;
                            c_i := c_i + 1;
                        END_WHILE;
                        FOR c_i := 0 TO 4 DO 
                            Xnorm0 := 0.0;
                            FOR b_H_tmp := 0 TO 4 DO 
                                Xnorm0 := (b_H[c_i + (5 * b_H_tmp)] * Rhs[b_H_tmp]) + Xnorm0;
                            END_FOR;
                            Opt[c_i] := Xnorm0;
                            u_i := 1;
                            WHILE (u_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                                b_H_tmp := INT_TO_DINT(DINT_TO_INT(u_i)) + 5;
                                IF (INT_TO_DINT(DINT_TO_INT(u_i)) + 5) > 32767 THEN 
                                    b_H_tmp := 32767;
                                END_IF;
                                Opt[c_i] := (b_D[((INT_TO_DINT(DINT_TO_INT(u_i)) - 1) * 5) + c_i] * Rhs[b_H_tmp - 1]) + Opt[c_i];
                                u_i := u_i + 1;
                            END_WHILE;
                        END_FOR;
                        c_i := 1;
                        WHILE (c_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                            Xnorm0 := 0.0;
                            FOR b_H_tmp := 0 TO 4 DO 
                                Xnorm0 := (b_D[((INT_TO_DINT(DINT_TO_INT(c_i)) - 1) * 5) + b_H_tmp] * Rhs[b_H_tmp]) + Xnorm0;
                            END_FOR;
                            b_H_tmp := INT_TO_DINT(DINT_TO_INT(c_i)) + 5;
                            IF (INT_TO_DINT(DINT_TO_INT(c_i)) + 5) > 32767 THEN 
                                b_H_tmp := 32767;
                            END_IF;
                            Opt[b_H_tmp - 1] := Xnorm0;
                            u_i := 1;
                            WHILE (u_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                                b_H_tmp := INT_TO_DINT(DINT_TO_INT(c_i)) + 5;
                                IF (INT_TO_DINT(DINT_TO_INT(c_i)) + 5) > 32767 THEN 
                                    b_H_tmp := 32767;
                                END_IF;
                                b_H_tmp_0 := INT_TO_DINT(DINT_TO_INT(c_i)) + 5;
                                IF (INT_TO_DINT(DINT_TO_INT(c_i)) + 5) > 32767 THEN 
                                    b_H_tmp_0 := 32767;
                                END_IF;
                                f_j := INT_TO_DINT(DINT_TO_INT(u_i)) + 5;
                                IF (INT_TO_DINT(DINT_TO_INT(u_i)) + 5) > 32767 THEN 
                                    f_j := 32767;
                                END_IF;
                                Opt[b_H_tmp - 1] := (U[(((INT_TO_DINT(DINT_TO_INT(u_i)) - 1) * 5) + INT_TO_DINT(DINT_TO_INT(c_i))) - 1] * Rhs[f_j - 1]) + Opt[b_H_tmp_0 - 1];
                                u_i := u_i + 1;
                            END_WHILE;
                            c_i := c_i + 1;
                        END_WHILE;
                        Xnorm0 := -1.0E-12;
                        kDrop := 0;
                        c_i := 1;
                        WHILE (c_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                            b_H_tmp := INT_TO_DINT(DINT_TO_INT(c_i)) + 5;
                            IF (INT_TO_DINT(DINT_TO_INT(c_i)) + 5) > 32767 THEN 
                                b_H_tmp := 32767;
                            END_IF;
                            unusedU0[INT_TO_DINT(iC[INT_TO_DINT(DINT_TO_INT(c_i)) - 1]) - 1] := Opt[b_H_tmp - 1];
                            b_H_tmp := INT_TO_DINT(DINT_TO_INT(c_i)) + 5;
                            IF (INT_TO_DINT(DINT_TO_INT(c_i)) + 5) > 32767 THEN 
                                b_H_tmp := 32767;
                            END_IF;
                            IF Opt[b_H_tmp - 1] < Xnorm0 THEN 
                                IF DINT_TO_INT(c_i) <= nA THEN 
                                    kDrop := DINT_TO_INT(c_i);
                                    b_H_tmp := INT_TO_DINT(DINT_TO_INT(c_i)) + 5;
                                    IF (INT_TO_DINT(DINT_TO_INT(c_i)) + 5) > 32767 THEN 
                                        b_H_tmp := 32767;
                                    END_IF;
                                    Xnorm0 := Opt[b_H_tmp - 1];
                                END_IF;
                            END_IF;
                            c_i := c_i + 1;
                        END_WHILE;
                        IF kDrop <= 0 THEN 
                            DualFeasible := TRUE;
                            FOR c_i := 0 TO 4 DO 
                                zopt[c_i] := Opt[c_i];
                            END_FOR;
                        ELSE 
                            b_i := b_i + 1;
                            IF b_i > UINT_TO_DINT(q) THEN 
                                nA := 0;
                                FOR c_i := 0 TO 7 DO 
                                    iA[c_i] := 0;
                                    iC[c_i] := 0;
                                END_FOR;
                                ColdReset := TRUE;
                            ELSE 
                                unusedU0[INT_TO_DINT(iC[INT_TO_DINT(kDrop) - 1]) - 1] := 0.0;
                                i0_DropConstraint(kDrop := kDrop, iA := iA, nA := nA, iC := iC);
                            END_IF;
                        END_IF;
                    END_IF;
                ELSE 
                    IF nA <= 0 THEN 
                        FOR c_i := 0 TO 7 DO 
                            unusedU0[c_i] := 0.0;
                        END_FOR;
                        FOR c_i := 0 TO 4 DO 
                            Xnorm0 := 0.0;
                            FOR b_H_tmp := 0 TO 4 DO 
                                Xnorm0 := (( -Implicit_b_Hinv[c_i + (5 * b_H_tmp)]) * AcRow[b_H_tmp]) + Xnorm0;
                            END_FOR;
                            zopt[c_i] := Xnorm0;
                        END_FOR;
                    END_IF;
                    exitg3 := 1;
                END_IF;
            UNTIL NOT(exitg3 = 0)
            END_REPEAT;
            IF exitg3 = 1 THEN 
                temp2 := TRUE;
            END_IF;
        ELSE 
            FOR c_i := 0 TO 4 DO 
                Xnorm0 := 0.0;
                FOR b_H_tmp := 0 TO 4 DO 
                    Xnorm0 := (( -Implicit_b_Hinv[c_i + (5 * b_H_tmp)]) * AcRow[b_H_tmp]) + Xnorm0;
                END_FOR;
                zopt[c_i] := Xnorm0;
            END_FOR;
            temp2 := TRUE;
        END_IF;
        IF temp2 THEN 
            Xnorm0 := norm(x := zopt);
            REPEAT 
                exitg2 := 0;
                IF b_i <= 120 THEN 
                    cMin := -1.0E-6;
                    kNext := 0;
                    FOR c_i := 0 TO 7 DO 
                        t := cTol[c_i];
                        IF  NOT cTolComputed THEN 
                            FOR b_H_tmp := 0 TO 4 DO 
                                AcRow[b_H_tmp] := SINT_TO_LREAL(b_Ac[c_i + (b_H_tmp * 8)]) * zopt[b_H_tmp];
                            END_FOR;
                            i0_abs_c(x := AcRow);
                            temp3 := i0_abs_c.y;
                            temp4 := maximum(x := temp3);
                            t := MAX(t, temp4);
                        END_IF;
                        IF iA[c_i] = 0 THEN 
                            cVal := 0.0;
                            FOR b_H_tmp := 0 TO 4 DO 
                                cVal := (SINT_TO_LREAL(b_Ac[c_i + (b_H_tmp * 8)]) * zopt[b_H_tmp]) + cVal;
                            END_FOR;
                            cVal := (cVal - Bc[c_i]) / t;
                            IF cVal < cMin THEN 
                                cMin := cVal;
                                kNext := DINT_TO_INT(c_i + 1);
                            END_IF;
                        END_IF;
                        cTol[c_i] := t;
                    END_FOR;
                    cTolComputed := TRUE;
                    IF kNext <= 0 THEN 
                        exitg2 := 1;
                    ELSIF b_i = 120 THEN 
                        b_i := 0;
                        exitg2 := 1;
                    ELSE 
                        REPEAT 
                            exitg1 := 0;
                            IF (kNext > 0) AND (b_i <= 120) THEN 
                                FOR b_H_tmp := 0 TO 4 DO 
                                    AcRow[b_H_tmp] := SINT_TO_LREAL(b_Ac[((b_H_tmp * 8) + INT_TO_DINT(kNext)) - 1]);
                                END_FOR;
                                temp2 := FALSE;
                                IF nA = 0 THEN 
                                    FOR b_H_tmp := 0 TO 4 DO 
                                        z[b_H_tmp] := 0.0;
                                        FOR b_H_tmp_0 := 0 TO 4 DO 
                                            z[b_H_tmp] := (Implicit_b_Hinv[(5 * b_H_tmp_0) + b_H_tmp] * AcRow[b_H_tmp_0]) + z[b_H_tmp];
                                        END_FOR;
                                    END_FOR;
                                    temp2 := TRUE;
                                ELSE 
                                    c_i := 1;
                                    FOR b_H_tmp := 0 TO 24 DO 
                                        RLinv[b_H_tmp] := 0.0;
                                    END_FOR;
                                    u_i := 1;
                                    WHILE (u_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                                        iC_0 := INT_TO_DINT(iC[INT_TO_DINT(DINT_TO_INT(u_i)) - 1]);
                                        FOR b_H_tmp := 0 TO 4 DO 
                                            f_j := b_H_tmp + (5 * (INT_TO_DINT(DINT_TO_INT(u_i)) - 1));
                                            RLinv[f_j] := 0.0;
                                            FOR b_H_tmp_0 := 0 TO 4 DO 
                                                RLinv[f_j] := (SINT_TO_LREAL(b_Ac[((b_H_tmp_0 * 8) + iC_0) - 1]) * Implicit_b_Linv[(5 * b_H_tmp_0) + b_H_tmp]) + RLinv[f_j];
                                            END_FOR;
                                        END_FOR;
                                        u_i := u_i + 1;
                                    END_WHILE;
                                    i0_qr(b_A := RLinv);
                                    QQ := i0_qr.Q;
                                    RR := i0_qr.b_R;
                                    u_i := 1;
                                    REPEAT 
                                        exitg4 := 0;
                                        IF (u_i - 1) <= (INT_TO_DINT(nA) - 1) THEN 
                                            IF ABS(RR[(((INT_TO_DINT(DINT_TO_INT(u_i)) - 1) * 5) + INT_TO_DINT(DINT_TO_INT(u_i))) - 1]) < 1.0E-12 THEN 
                                                c_i := -2;
                                                exitg4 := 1;
                                            ELSE 
                                                u_i := u_i + 1;
                                            END_IF;
                                        ELSE 
                                            FOR u_i := 0 TO 4 DO 
                                                FOR f_j := 0 TO 4 DO 
                                                    cMin := 0.0;
                                                    FOR b_H_tmp := 0 TO 4 DO 
                                                        cMin := (Implicit_b_Linv[(u_i * 5) + b_H_tmp] * QQ[(f_j * 5) + b_H_tmp]) + cMin;
                                                    END_FOR;
                                                    TL[u_i + (5 * f_j)] := cMin;
                                                END_FOR;
                                            END_FOR;
                                            FOR b_H_tmp := 0 TO 24 DO 
                                                RLinv[b_H_tmp] := 0.0;
                                            END_FOR;
                                            kDrop := nA;
                                            WHILE kDrop > 0 DO
                                                b_H_tmp := 5 * (INT_TO_DINT(kDrop) - 1);
                                                f_j := (INT_TO_DINT(kDrop) + b_H_tmp) - 1;
                                                RLinv[f_j] := 1.0;
                                                iSave := kDrop;
                                                WHILE iSave <= nA DO
                                                    b_H_tmp_0 := (((INT_TO_DINT(iSave) - 1) * 5) + INT_TO_DINT(kDrop)) - 1;
                                                    RLinv[b_H_tmp_0] := RLinv[b_H_tmp_0] / RR[f_j];
                                                    iSave := DINT_TO_INT(INT_TO_DINT(iSave) + 1);
                                                END_WHILE;
                                                IF kDrop > 1 THEN 
                                                    u_i := 1;
                                                    WHILE (u_i - 1) <= (INT_TO_DINT(kDrop) - 2) DO
                                                        iSave := kDrop;
                                                        WHILE iSave <= nA DO
                                                            f_j := (INT_TO_DINT(iSave) - 1) * 5;
                                                            b_H_tmp_0 := (f_j + INT_TO_DINT(DINT_TO_INT(u_i))) - 1;
                                                            RLinv[b_H_tmp_0] := RLinv[b_H_tmp_0] - (RR[(b_H_tmp + INT_TO_DINT(DINT_TO_INT(u_i))) - 1] * RLinv[(f_j + INT_TO_DINT(kDrop)) - 1]);
                                                            iSave := DINT_TO_INT(INT_TO_DINT(iSave) + 1);
                                                        END_WHILE;
                                                        u_i := u_i + 1;
                                                    END_WHILE;
                                                END_IF;
                                                kDrop := DINT_TO_INT(INT_TO_DINT(kDrop) - 1);
                                            END_WHILE;
                                            FOR u_i := 0 TO 4 DO 
                                                kDrop := DINT_TO_INT(u_i + 1);
                                                WHILE kDrop <= 5 DO
                                                    f_j := 5 * (INT_TO_DINT(kDrop) - 1);
                                                    b_H[u_i + f_j] := 0.0;
                                                    b_H_tmp := INT_TO_DINT(nA) + 1;
                                                    IF (INT_TO_DINT(nA) + 1) > 32767 THEN 
                                                        b_H_tmp := 32767;
                                                    END_IF;
                                                    iSave := DINT_TO_INT(b_H_tmp);
                                                    WHILE iSave <= 5 DO
                                                        b_H_tmp := (INT_TO_DINT(iSave) - 1) * 5;
                                                        b_H_tmp_0 := ((INT_TO_DINT(kDrop) - 1) * 5) + u_i;
                                                        b_H[b_H_tmp_0] := b_H[b_H_tmp_0] - (TL[(b_H_tmp + INT_TO_DINT(kDrop)) - 1] * TL[b_H_tmp + u_i]);
                                                        iSave := DINT_TO_INT(INT_TO_DINT(iSave) + 1);
                                                    END_WHILE;
                                                    b_H[(INT_TO_DINT(kDrop) + (5 * u_i)) - 1] := b_H[f_j + u_i];
                                                    kDrop := DINT_TO_INT(INT_TO_DINT(kDrop) + 1);
                                                END_WHILE;
                                            END_FOR;
                                            u_i := 1;
                                            WHILE (u_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                                                FOR f_j := 0 TO 4 DO 
                                                    b_H_tmp := f_j + (5 * (INT_TO_DINT(DINT_TO_INT(u_i)) - 1));
                                                    b_D[b_H_tmp] := 0.0;
                                                    kDrop := DINT_TO_INT(u_i);
                                                    WHILE kDrop <= nA DO
                                                        b_H_tmp_0 := (INT_TO_DINT(kDrop) - 1) * 5;
                                                        b_D[b_H_tmp] := (RLinv[(b_H_tmp_0 + INT_TO_DINT(DINT_TO_INT(u_i))) - 1] * TL[b_H_tmp_0 + f_j]) + b_D[b_H_tmp];
                                                        kDrop := DINT_TO_INT(INT_TO_DINT(kDrop) + 1);
                                                    END_WHILE;
                                                END_FOR;
                                                u_i := u_i + 1;
                                            END_WHILE;
                                            exitg4 := 1;
                                        END_IF;
                                    UNTIL NOT(exitg4 = 0)
                                    END_REPEAT;
                                    IF c_i <= 0 THEN 
                                        b_i := -2;
                                        exitg1 := 1;
                                    ELSE 
                                        FOR b_H_tmp := 0 TO 24 DO 
                                            U[b_H_tmp] :=  -b_H[b_H_tmp];
                                        END_FOR;
                                        FOR b_H_tmp := 0 TO 4 DO 
                                            z[b_H_tmp] := 0.0;
                                            FOR b_H_tmp_0 := 0 TO 4 DO 
                                                z[b_H_tmp] := (U[(5 * b_H_tmp_0) + b_H_tmp] * AcRow[b_H_tmp_0]) + z[b_H_tmp];
                                            END_FOR;
                                        END_FOR;
                                        WHILE (c_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                                            t := 0.0;
                                            FOR b_H_tmp := 0 TO 4 DO 
                                                t := (b_D[((INT_TO_DINT(DINT_TO_INT(c_i)) - 1) * 5) + b_H_tmp] * AcRow[b_H_tmp]) + t;
                                            END_FOR;
                                            b_r[INT_TO_DINT(DINT_TO_INT(c_i)) - 1] := t;
                                            c_i := c_i + 1;
                                        END_WHILE;
                                        temp2 := TRUE;
                                    END_IF;
                                END_IF;
                                IF temp2 THEN 
                                    kDrop := 0;
                                    cMin := 0.0;
                                    DualFeasible := TRUE;
                                    ColdReset := TRUE;
                                    IF nA > 0 THEN 
                                        c_i := 0;
                                        REPEAT 
                                            exitg4 := 0;
                                            IF c_i <= (INT_TO_DINT(nA) - 1) THEN 
                                                IF b_r[c_i] >= 1.0E-12 THEN 
                                                    ColdReset := FALSE;
                                                    exitg4 := 1;
                                                ELSE 
                                                    c_i := c_i + 1;
                                                END_IF;
                                            ELSE 
                                                exitg4 := 1;
                                            END_IF;
                                        UNTIL NOT(exitg4 = 0)
                                        END_REPEAT;
                                    END_IF;
                                    IF (nA <> 0) AND ( NOT ColdReset) THEN 
                                        c_i := 1;
                                        WHILE (c_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                                            cVal := b_r[INT_TO_DINT(DINT_TO_INT(c_i)) - 1];
                                            IF cVal > 1.0E-12 THEN 
                                                cVal := unusedU0[INT_TO_DINT(iC[INT_TO_DINT(DINT_TO_INT(c_i)) - 1]) - 1] / cVal;
                                                IF (kDrop = 0) OR (cVal < rMin) THEN 
                                                    rMin := cVal;
                                                    kDrop := DINT_TO_INT(c_i);
                                                END_IF;
                                            END_IF;
                                            c_i := c_i + 1;
                                        END_WHILE;
                                        IF kDrop > 0 THEN 
                                            cMin := rMin;
                                            DualFeasible := FALSE;
                                        END_IF;
                                    END_IF;
                                    cVal := mtimes(b_A := z, B := AcRow);
                                    IF cVal <= 0.0 THEN 
                                        cVal := 0.0;
                                        ColdReset := TRUE;
                                    ELSE 
                                        t := 0.0;
                                        FOR b_H_tmp := 0 TO 4 DO 
                                            t := (AcRow[b_H_tmp] * zopt[b_H_tmp]) + t;
                                        END_FOR;
                                        cVal := (Bc[INT_TO_DINT(kNext) - 1] - t) / cVal;
                                        ColdReset := FALSE;
                                    END_IF;
                                    IF DualFeasible AND ColdReset THEN 
                                        b_i := -1;
                                        exitg1 := 1;
                                    ELSE 
                                        IF ColdReset THEN 
                                            t := cMin;
                                        ELSIF DualFeasible THEN 
                                            t := cVal;
                                        ELSIF cMin < cVal THEN 
                                            t := cMin;
                                        ELSE 
                                            t := cVal;
                                        END_IF;
                                        c_i := 1;
                                        WHILE (c_i - 1) <= (INT_TO_DINT(nA) - 1) DO
                                            u_i := INT_TO_DINT(iC[INT_TO_DINT(DINT_TO_INT(c_i)) - 1]);
                                            unusedU0[u_i - 1] := unusedU0[u_i - 1] - (b_r[INT_TO_DINT(DINT_TO_INT(c_i)) - 1] * t);
                                            IF u_i <= 8 THEN 
                                                IF unusedU0[u_i - 1] < 0.0 THEN 
                                                    unusedU0[u_i - 1] := 0.0;
                                                END_IF;
                                            END_IF;
                                            c_i := c_i + 1;
                                        END_WHILE;
                                        unusedU0[INT_TO_DINT(kNext) - 1] := unusedU0[INT_TO_DINT(kNext) - 1] + t;
                                        IF t = cMin THEN 
                                            i0_DropConstraint(kDrop := kDrop, iA := iA, nA := nA, iC := iC);
                                        END_IF;
                                        IF  NOT ColdReset THEN 
                                            FOR b_H_tmp := 0 TO 4 DO 
                                                zopt[b_H_tmp] := (t * z[b_H_tmp]) + zopt[b_H_tmp];
                                            END_FOR;
                                            IF t = cVal THEN 
                                                IF nA = 5 THEN 
                                                    b_i := -1;
                                                    exitg1 := 1;
                                                ELSE 
                                                    b_H_tmp := INT_TO_DINT(nA) + 1;
                                                    IF (INT_TO_DINT(nA) + 1) > 32767 THEN 
                                                        b_H_tmp := 32767;
                                                    END_IF;
                                                    nA := DINT_TO_INT(b_H_tmp);
                                                    iC[INT_TO_DINT(DINT_TO_INT(b_H_tmp)) - 1] := kNext;
                                                    kDrop := DINT_TO_INT(b_H_tmp);
                                                    REPEAT 
                                                        exitg4 := 0;
                                                        IF kDrop > 1 THEN 
                                                            iSave := iC[INT_TO_DINT(kDrop) - 1];
                                                            temp1 := iC[INT_TO_DINT(kDrop) - 2];
                                                            IF iSave > temp1 THEN 
                                                                exitg4 := 1;
                                                            ELSE 
                                                                iC[INT_TO_DINT(kDrop) - 1] := temp1;
                                                                iC[INT_TO_DINT(kDrop) - 2] := iSave;
                                                                kDrop := DINT_TO_INT(INT_TO_DINT(kDrop) - 1);
                                                            END_IF;
                                                        ELSE 
                                                            exitg4 := 1;
                                                        END_IF;
                                                    UNTIL NOT(exitg4 = 0)
                                                    END_REPEAT;
                                                    iA[INT_TO_DINT(kNext) - 1] := 1;
                                                    kNext := 0;
                                                    b_i := b_i + 1;
                                                END_IF;
                                            ELSE 
                                                b_i := b_i + 1;
                                            END_IF;
                                        ELSE 
                                            b_i := b_i + 1;
                                        END_IF;
                                    END_IF;
                                END_IF;
                            ELSE 
                                cMin := norm(x := zopt);
                                IF ABS(cMin - Xnorm0) > 0.001 THEN 
                                    Xnorm0 := cMin;
                                    i0_abs_c3(x := Bc);
                                    temp5 := i0_abs_c3.y;
                                    i0_maximum2(x := temp5, y := 1.0);
                                    cTol := i0_maximum2.ex;
                                    cTolComputed := FALSE;
                                END_IF;
                                exitg1 := 2;
                            END_IF;
                        UNTIL NOT(exitg1 = 0)
                        END_REPEAT;
                        IF exitg1 = 1 THEN 
                            exitg2 := 1;
                        END_IF;
                    END_IF;
                ELSE 
                    exitg2 := 1;
                END_IF;
            UNTIL NOT(exitg2 = 0)
            END_REPEAT;
        END_IF;
        IF (b_i < 0) OR (b_i = 0) THEN 
            FOR c_i := 0 TO 4 DO 
                zopt[c_i] := 0.0;
            END_FOR;
        END_IF;
        mv[0] := old_u_idx_0 + zopt[0];
        mv[1] := old_u_idx_1 + zopt[1];
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
        (* '<S24>:1:154' if return_xseq || return_ovseq *)
        (* '<S24>:1:156' else *)
        (* '<S24>:1:157' yseq = zeros(p+1,ny,'like',rseq); *)
        (* '<S24>:1:158' xseq = zeros(p+1,nxQP,'like',rseq); *)
        (* '<S24>:1:161' if CustomEstimation==ONE *)
        (* '<S24>:1:163' else *)
        (* update x[k+1|k], assuming that above u and v will be applied. *)
        (* '<S24>:1:165' xk1 = A*xk + Bu*(u - uoff) + Bv*v + L*y_innov; *)
        (* '<S24>:1:167' xk1 = xk1 + xoff; *)
        (* Updated state must include offset *)
        (* return xest in original value *)
        (* '<S24>:1:170' xest = xest + xoff; *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        (* Update for Memory: '<S3>/Memory' incorporates:
         *  MATLAB Function: '<S23>/optimizer' *)
        FOR c_i := 0 TO 7 DO 
            Memory_PreviousInput[c_i] := iA[c_i] <> 0;
        END_FOR;
        (* End of Update for Memory: '<S3>/Memory' *)
        
        (* Update for UnitDelay: '<S3>/last_mv' *)
        last_mv_DSTATE[0] := mv[0];
        (* MATLAB Function: '<S23>/optimizer' incorporates:
         *  UnitDelay: '<S3>/last_mv' *)
        old_u_idx_0 := mv[0];
        (* Update for UnitDelay: '<S3>/last_mv' *)
        old_u_idx_1 := mv[1];
        last_mv_DSTATE[1] := mv[1];
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
        (* Outputs for Atomic SubSystem: '<Root>/Implicit Controller' *)
        FOR b_H_tmp := 0 TO 5 DO 
            (* MATLAB Function: '<S23>/optimizer' *)
            rtb_xest[b_H_tmp] := 0.0;
            FOR b_H_tmp_0 := 0 TO 5 DO 
                rtb_xest[b_H_tmp] := (Implicit_d_a[(6 * b_H_tmp_0) + b_H_tmp] * xk[b_H_tmp_0]) + rtb_xest[b_H_tmp];
            END_FOR;
            (* Update for Memory: '<S3>/last_x' incorporates:
             *  MATLAB Function: '<S23>/optimizer' *)
            last_x_PreviousInput[b_H_tmp] := ((Implicit_f_a[b_H_tmp + 6] * y_innov[1]) + (Implicit_f_a[b_H_tmp] * y_innov[0])) + (rtb_xest[b_H_tmp] + ((Implicit_e_a[b_H_tmp + 6] * old_u_idx_1) + (Implicit_e_a[b_H_tmp] * old_u_idx_0)));
        END_FOR;
        (* End of Outputs for SubSystem: '<Root>/Implicit Controller' *)
END_CASE;
END_FUNCTION_BLOCK
FUNCTION mtimes: LREAL
VAR_INPUT
    b_A: ARRAY [0..4] OF LREAL;
    B: ARRAY [0..4] OF LREAL;
END_VAR
VAR_TEMP
    k: DINT;
END_VAR
mtimes := 0.0;
FOR k := 0 TO 4 DO 
    mtimes := (b_A[k] * B[k]) + mtimes;
END_FOR;
END_FUNCTION
FUNCTION_BLOCK qr
VAR_INPUT
    b_A: ARRAY [0..24] OF LREAL;
END_VAR
VAR_OUTPUT
    Q: ARRAY [0..24] OF LREAL;
    b_R: ARRAY [0..24] OF LREAL;
END_VAR
VAR
    i0_xgerc: xgerc;
    i0_xgemv: xgemv;
END_VAR
VAR_TEMP
    c_A: ARRAY [0..24] OF LREAL;
    tau: ARRAY [0..4] OF LREAL;
    itau: DINT;
    work: ARRAY [0..4] OF LREAL;
    ii: DINT;
    b_atmp: LREAL;
    beta1: LREAL;
    knt: DINT;
    c_lastc: DINT;
    coltop: DINT;
    ia: DINT;
    b_coltop: DINT;
    a: LREAL;
    exitg1: DINT;
    exitg2: DINT;
    temp6: LREAL;
END_VAR
FOR itau := 0 TO 4 DO 
    tau[itau] := 0.0;
END_FOR;
FOR itau := 0 TO 24 DO 
    c_A[itau] := b_A[itau];
END_FOR;
FOR itau := 0 TO 4 DO 
    work[itau] := 0.0;
END_FOR;
FOR itau := 0 TO 4 DO 
    ii := (itau * 5) + itau;
    IF (itau + 1) < 5 THEN 
        b_atmp := c_A[ii];
        tau[itau] := 0.0;
        beta1 := xnrm2(b_n := 4 - itau, x := c_A, ix0 := ii + 2);
        IF beta1 <> 0.0 THEN 
            a := ABS(c_A[ii]);
            beta1 := ABS(beta1);
            IF a < beta1 THEN 
                a := a / beta1;
                beta1 := SQRT((a * a) + 1.0) * beta1;
            ELSIF a > beta1 THEN 
                beta1 := beta1 / a;
                beta1 := SQRT((beta1 * beta1) + 1.0) * a;
            ELSE 
                beta1 := a * 1.4142135623730951;
            END_IF;
            IF c_A[ii] >= 0.0 THEN 
                beta1 :=  -beta1;
            END_IF;
            IF ABS(beta1) < 1.0020841800044864E-292 THEN 
                knt := -1;
                c_lastc := ii - itau;
                REPEAT 
                    knt := knt + 1;
                    b_coltop := ii + 1;
                    WHILE (b_coltop + 1) <= (c_lastc + 5) DO
                        c_A[b_coltop] := 9.9792015476736E+291 * c_A[b_coltop];
                        b_coltop := b_coltop + 1;
                    END_WHILE;
                    beta1 := beta1 * 9.9792015476736E+291;
                    b_atmp := b_atmp * 9.9792015476736E+291;
                UNTIL NOT(ABS(beta1) < 1.0020841800044864E-292)
                END_REPEAT;
                a := ABS(b_atmp);
                temp6 := xnrm2(b_n := 4 - itau, x := c_A, ix0 := ii + 2);
                beta1 := ABS(temp6);
                IF a < beta1 THEN 
                    a := a / beta1;
                    beta1 := SQRT((a * a) + 1.0) * beta1;
                ELSIF a > beta1 THEN 
                    beta1 := beta1 / a;
                    beta1 := SQRT((beta1 * beta1) + 1.0) * a;
                ELSE 
                    beta1 := a * 1.4142135623730951;
                END_IF;
                IF b_atmp >= 0.0 THEN 
                    beta1 :=  -beta1;
                END_IF;
                tau[itau] := (beta1 - b_atmp) / beta1;
                b_atmp := 1.0 / (b_atmp - beta1);
                c_lastc := ii - itau;
                b_coltop := ii + 1;
                WHILE (b_coltop + 1) <= (c_lastc + 5) DO
                    c_A[b_coltop] := b_atmp * c_A[b_coltop];
                    b_coltop := b_coltop + 1;
                END_WHILE;
                c_lastc := 0;
                WHILE c_lastc <= knt DO
                    beta1 := beta1 * 1.0020841800044864E-292;
                    c_lastc := c_lastc + 1;
                END_WHILE;
                b_atmp := beta1;
            ELSE 
                tau[itau] := (beta1 - c_A[ii]) / beta1;
                b_atmp := 1.0 / (c_A[ii] - beta1);
                knt := ii - itau;
                c_lastc := ii + 1;
                WHILE (c_lastc + 1) <= (knt + 5) DO
                    c_A[c_lastc] := b_atmp * c_A[c_lastc];
                    c_lastc := c_lastc + 1;
                END_WHILE;
                b_atmp := beta1;
            END_IF;
        END_IF;
        c_A[ii] := b_atmp;
        b_atmp := c_A[ii];
        c_A[ii] := 1.0;
        IF tau[itau] <> 0.0 THEN 
            knt := 5 - itau;
            c_lastc := ii - itau;
            REPEAT 
                exitg1 := 0;
                IF knt > 0 THEN 
                    IF c_A[c_lastc + 4] = 0.0 THEN 
                        knt := knt - 1;
                        c_lastc := c_lastc - 1;
                    ELSE 
                        exitg1 := 1;
                    END_IF;
                ELSE 
                    exitg1 := 1;
                END_IF;
            UNTIL NOT(exitg1 = 0)
            END_REPEAT;
            c_lastc := 4 - itau;
            REPEAT 
                exitg2 := 0;
                IF c_lastc > 0 THEN 
                    b_coltop := (((c_lastc - 1) * 5) + ii) + 5;
                    coltop := b_coltop;
                    REPEAT 
                        exitg1 := 0;
                        IF (coltop + 1) <= (b_coltop + knt) THEN 
                            IF c_A[coltop] <> 0.0 THEN 
                                exitg1 := 1;
                            ELSE 
                                coltop := coltop + 1;
                            END_IF;
                        ELSE 
                            c_lastc := c_lastc - 1;
                            exitg1 := 2;
                        END_IF;
                    UNTIL NOT(exitg1 = 0)
                    END_REPEAT;
                    IF exitg1 = 1 THEN 
                        exitg2 := 1;
                    END_IF;
                ELSE 
                    exitg2 := 1;
                END_IF;
            UNTIL NOT(exitg2 = 0)
            END_REPEAT;
        ELSE 
            knt := 0;
            c_lastc := 0;
        END_IF;
        IF knt > 0 THEN 
            i0_xgemv(b_m := knt, b_n := c_lastc, b_A := c_A, ia0 := ii + 6, x := c_A, ix0 := ii + 1, y := work);
            i0_xgerc(b_m := knt, b_n := c_lastc, alpha1 :=  -tau[itau], ix0 := ii + 1, y := work, b_A := c_A, ia0 := ii + 6);
        END_IF;
        c_A[ii] := b_atmp;
    ELSE 
        tau[4] := 0.0;
    END_IF;
END_FOR;
FOR itau := 0 TO 4 DO 
    ii := 0;
    WHILE ii <= itau DO
        b_R[ii + (5 * itau)] := c_A[(5 * itau) + ii];
        ii := ii + 1;
    END_WHILE;
    ii := itau + 1;
    WHILE (ii + 1) < 6 DO
        b_R[ii + (5 * itau)] := 0.0;
        ii := ii + 1;
    END_WHILE;
    work[itau] := 0.0;
END_FOR;
itau := 4;
FOR ii := 4 TO 0 BY -1 DO 
    knt := ((ii * 5) + ii) + 6;
    IF (ii + 1) < 5 THEN 
        c_A[knt - 6] := 1.0;
        IF tau[itau] <> 0.0 THEN 
            c_lastc := 5 - ii;
            b_coltop := knt - ii;
            REPEAT 
                exitg1 := 0;
                IF c_lastc > 0 THEN 
                    IF c_A[b_coltop - 2] = 0.0 THEN 
                        c_lastc := c_lastc - 1;
                        b_coltop := b_coltop - 1;
                    ELSE 
                        exitg1 := 1;
                    END_IF;
                ELSE 
                    exitg1 := 1;
                END_IF;
            UNTIL NOT(exitg1 = 0)
            END_REPEAT;
            b_coltop := 4 - ii;
            REPEAT 
                exitg2 := 0;
                IF b_coltop > 0 THEN 
                    coltop := ((b_coltop - 1) * 5) + knt;
                    ia := coltop;
                    REPEAT 
                        exitg1 := 0;
                        IF ia <= ((coltop + c_lastc) - 1) THEN 
                            IF c_A[ia - 1] <> 0.0 THEN 
                                exitg1 := 1;
                            ELSE 
                                ia := ia + 1;
                            END_IF;
                        ELSE 
                            b_coltop := b_coltop - 1;
                            exitg1 := 2;
                        END_IF;
                    UNTIL NOT(exitg1 = 0)
                    END_REPEAT;
                    IF exitg1 = 1 THEN 
                        exitg2 := 1;
                    END_IF;
                ELSE 
                    exitg2 := 1;
                END_IF;
            UNTIL NOT(exitg2 = 0)
            END_REPEAT;
        ELSE 
            c_lastc := 0;
            b_coltop := 0;
        END_IF;
        IF c_lastc > 0 THEN 
            i0_xgemv(b_m := c_lastc, b_n := b_coltop, b_A := c_A, ia0 := knt, x := c_A, ix0 := knt - 5, y := work);
            i0_xgerc(b_m := c_lastc, b_n := b_coltop, alpha1 :=  -tau[itau], ix0 := knt - 5, y := work, b_A := c_A, ia0 := knt);
        END_IF;
        c_lastc := (knt - ii) - 1;
        b_coltop := knt - 5;
        WHILE (b_coltop + 1) <= c_lastc DO
            c_A[b_coltop] := ( -tau[itau]) * c_A[b_coltop];
            b_coltop := b_coltop + 1;
        END_WHILE;
    END_IF;
    c_A[knt - 6] := 1.0 - tau[itau];
    c_lastc := 0;
    WHILE c_lastc <= (ii - 1) DO
        c_A[(knt - c_lastc) - 7] := 0.0;
        c_lastc := c_lastc + 1;
    END_WHILE;
    itau := itau - 1;
END_FOR;
FOR itau := 0 TO 4 DO 
    FOR ii := 0 TO 4 DO 
        Q[ii + (5 * itau)] := c_A[(5 * itau) + ii];
    END_FOR;
END_FOR;
END_FUNCTION_BLOCK
FUNCTION_BLOCK xgerc
VAR_INPUT
    b_m: DINT;
    b_n: DINT;
    alpha1: LREAL;
    ix0: DINT;
    y: ARRAY [0..4] OF LREAL;
    ia0: DINT;
END_VAR
VAR_IN_OUT
    b_A: ARRAY [0..24] OF LREAL;
END_VAR
VAR_TEMP
    jA: DINT;
    jy: DINT;
    temp: LREAL;
    ix: DINT;
    j: DINT;
    b: DINT;
    ijA: DINT;
END_VAR
IF alpha1 <> 0.0 THEN 
    jA := ia0 - 1;
    jy := 0;
    j := 0;
    WHILE j <= (b_n - 1) DO
        IF y[jy] <> 0.0 THEN 
            temp := y[jy] * alpha1;
            ix := ix0;
            b := b_m + jA;
            ijA := jA;
            WHILE (ijA + 1) <= b DO
                b_A[ijA] := (b_A[ix - 1] * temp) + b_A[ijA];
                ix := ix + 1;
                ijA := ijA + 1;
            END_WHILE;
        END_IF;
        jy := jy + 1;
        jA := jA + 5;
        j := j + 1;
    END_WHILE;
END_IF;
END_FUNCTION_BLOCK
FUNCTION_BLOCK xgemv
VAR_INPUT
    b_m: DINT;
    b_n: DINT;
    b_A: ARRAY [0..24] OF LREAL;
    ia0: DINT;
    x: ARRAY [0..24] OF LREAL;
    ix0: DINT;
END_VAR
VAR_IN_OUT
    y: ARRAY [0..4] OF LREAL;
END_VAR
VAR_TEMP
    ix: DINT;
    b_c: LREAL;
    b_iy: DINT;
    b: DINT;
    iac: DINT;
    b_d: DINT;
    ia: DINT;
END_VAR
IF (b_m <> 0) AND (b_n <> 0) THEN 
    b_iy := 0;
    WHILE b_iy <= (b_n - 1) DO
        y[b_iy] := 0.0;
        b_iy := b_iy + 1;
    END_WHILE;
    b_iy := 0;
    b := ((b_n - 1) * 5) + ia0;
    iac := ia0;
    WHILE iac <= b DO
        ix := ix0;
        b_c := 0.0;
        b_d := (iac + b_m) - 1;
        ia := iac;
        WHILE ia <= b_d DO
            b_c := (b_A[ia - 1] * x[ix - 1]) + b_c;
            ix := ix + 1;
            ia := ia + 1;
        END_WHILE;
        y[b_iy] := y[b_iy] + b_c;
        b_iy := b_iy + 1;
        iac := iac + 5;
    END_WHILE;
END_IF;
END_FUNCTION_BLOCK
FUNCTION xnrm2: LREAL
VAR_INPUT
    b_n: DINT;
    x: ARRAY [0..24] OF LREAL;
    ix0: DINT;
END_VAR
VAR_TEMP
    scale: LREAL;
    kend: DINT;
    absxk: LREAL;
    t: LREAL;
    k: DINT;
END_VAR
xnrm2 := 0.0;
IF b_n >= 1 THEN 
    IF b_n = 1 THEN 
        xnrm2 := ABS(x[ix0 - 1]);
    ELSE 
        scale := 3.3121686421112381E-170;
        kend := (ix0 + b_n) - 1;
        k := ix0;
        WHILE k <= kend DO
            absxk := ABS(x[k - 1]);
            IF absxk > scale THEN 
                t := scale / absxk;
                xnrm2 := ((xnrm2 * t) * t) + 1.0;
                scale := absxk;
            ELSE 
                t := absxk / scale;
                xnrm2 := (t * t) + xnrm2;
            END_IF;
            k := k + 1;
        END_WHILE;
        xnrm2 := scale * SQRT(xnrm2);
    END_IF;
END_IF;
END_FUNCTION
FUNCTION norm: LREAL
VAR_INPUT
    x: ARRAY [0..4] OF LREAL;
END_VAR
VAR_TEMP
    scale: LREAL;
    absxk: LREAL;
    t: LREAL;
    k: DINT;
END_VAR
norm := 0.0;
scale := 3.3121686421112381E-170;
FOR k := 0 TO 4 DO 
    absxk := ABS(x[k]);
    IF absxk > scale THEN 
        t := scale / absxk;
        norm := ((norm * t) * t) + 1.0;
        scale := absxk;
    ELSE 
        t := absxk / scale;
        norm := (t * t) + norm;
    END_IF;
END_FOR;
norm := scale * SQRT(norm);
END_FUNCTION
FUNCTION_BLOCK mpcblock_refmd
VAR_INPUT
    ref: ARRAY [0..1] OF LREAL;
    b_yoff: ARRAY [0..1] OF LREAL;
    b_RYscale: ARRAY [0..1] OF LREAL;
END_VAR
VAR_OUTPUT
    rseq: ARRAY [0..5] OF LREAL;
    vseq: ARRAY [0..3] OF LREAL;
    v: LREAL;
END_VAR
VAR_TEMP
    i: DINT;
    rseq_tmp: DINT;
END_VAR
vseq[0] := 1.0;
vseq[1] := 1.0;
vseq[2] := 1.0;
vseq[3] := 1.0;
FOR i := 0 TO 2 DO 
    rseq_tmp := DWORD_TO_DINT(SHL(DINT_TO_DWORD(i), 1));
    rseq[rseq_tmp] := (ref[0] * b_RYscale[0]) - b_yoff[0];
    rseq[rseq_tmp + 1] := (ref[1] * b_RYscale[1]) - b_yoff[1];
END_FOR;
v := 1.0;
END_FUNCTION_BLOCK
FUNCTION_BLOCK DropConstraint
VAR_INPUT
    kDrop: INT;
END_VAR
VAR_IN_OUT
    iA: ARRAY [0..7] OF INT;
    nA: INT;
    iC: ARRAY [0..7] OF INT;
END_VAR
VAR_TEMP
    i: INT;
    tmp: DINT;
END_VAR
iA[INT_TO_DINT(iC[INT_TO_DINT(kDrop) - 1]) - 1] := 0;
IF kDrop < nA THEN 
    tmp := INT_TO_DINT(nA) - 1;
    IF (INT_TO_DINT(nA) - 1) < -32768 THEN 
        tmp := -32768;
    END_IF;
    i := kDrop;
    WHILE i <= DINT_TO_INT(tmp) DO
        iC[INT_TO_DINT(i) - 1] := iC[INT_TO_DINT(i)];
        i := DINT_TO_INT(INT_TO_DINT(i) + 1);
    END_WHILE;
END_IF;
iC[INT_TO_DINT(nA) - 1] := 0;
tmp := INT_TO_DINT(nA) - 1;
IF (INT_TO_DINT(nA) - 1) < -32768 THEN 
    tmp := -32768;
END_IF;
nA := DINT_TO_INT(tmp);
END_FUNCTION_BLOCK
FUNCTION maximum: LREAL
VAR_INPUT
    x: ARRAY [0..4] OF LREAL;
END_VAR
maximum := x[0];
IF x[0] < x[1] THEN 
    maximum := x[1];
END_IF;
IF maximum < x[2] THEN 
    maximum := x[2];
END_IF;
IF maximum < x[3] THEN 
    maximum := x[3];
END_IF;
IF maximum < x[4] THEN 
    maximum := x[4];
END_IF;
END_FUNCTION
FUNCTION_BLOCK maximum2
VAR_INPUT
    x: ARRAY [0..7] OF LREAL;
    y: LREAL;
END_VAR
VAR_OUTPUT
    ex: ARRAY [0..7] OF LREAL;
END_VAR
VAR_TEMP
    k: DINT;
END_VAR
FOR k := 0 TO 7 DO 
    ex[k] := MAX(x[k], y);
END_FOR;
END_FUNCTION_BLOCK
FUNCTION_BLOCK abs_c
VAR_INPUT
    x: ARRAY [0..4] OF LREAL;
END_VAR
VAR_OUTPUT
    y: ARRAY [0..4] OF LREAL;
END_VAR
VAR_TEMP
    k: DINT;
END_VAR
FOR k := 0 TO 4 DO 
    y[k] := ABS(x[k]);
END_FOR;
END_FUNCTION_BLOCK
FUNCTION_BLOCK abs_c3
VAR_INPUT
    x: ARRAY [0..7] OF LREAL;
END_VAR
VAR_OUTPUT
    y: ARRAY [0..7] OF LREAL;
END_VAR
VAR_TEMP
    k: DINT;
END_VAR
FOR k := 0 TO 7 DO 
    y[k] := ABS(x[k]);
END_FOR;
END_FUNCTION_BLOCK
VAR_GLOBAL CONSTANT
    SS_INITIALIZE: SINT := 0;
    SS_STEP: SINT := 1;
END_VAR
