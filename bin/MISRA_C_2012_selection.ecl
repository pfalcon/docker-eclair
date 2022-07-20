-project_name=getenv("ECLAIR_PROJECT_NAME")
-project_root=getenv("ECLAIR_PROJECT_ROOT")

-setq=data_dir,getenv("ECLAIR_DATA_DIR")

-enable=B.REPORT.ECB
-config=B.REPORT.ECB,output=join_paths(data_dir,"FRAME.@FRAME@.ecb")
-config=B.REPORT.ECB,preprocessed=show
-config=B.REPORT.ECB,macros=10

-enable=B.EXPLAIN

-doc_begin="See https://developer.trustedfirmware.org/w/tf_a/tf-a-misra-analysis/"
-enable=MC3R1.D1.1
-enable=MC3R1.D2.1
-enable=MC3R1.D4.1
-enable=MC3R1.D4.2
-enable=MC3R1.D4.3
-enable=MC3R1.D4.4
-enable=MC3R1.D4.5
-enable=MC3R1.D4.7
-enable=MC3R1.D4.10
-enable=MC3R1.D4.11
-enable=MC3R1.D4.12
-enable=MC3R1.D4.13
-enable=MC3R1.D4.14
-enable=MC3R1.R1.1
-enable=MC3R1.R1.2
-enable=MC3R1.R1.3
-enable=MC3R1.R2.1
-enable=MC3R1.R2.2
-enable=MC3R1.R2.3
-enable=MC3R1.R2.6
-enable=MC3R1.R3.1
-enable=MC3R1.R3.2
-enable=MC3R1.R4.1
-enable=MC3R1.R4.2
-enable=MC3R1.R5.2
-enable=MC3R1.R5.3
-enable=MC3R1.R5.4
-enable=MC3R1.R5.5
-enable=MC3R1.R5.6
-enable=MC3R1.R5.7
-enable=MC3R1.R5.9
-enable=MC3R1.R6.1
-enable=MC3R1.R6.2
-enable=MC3R1.R7.1
-enable=MC3R1.R7.2
-enable=MC3R1.R7.3
-enable=MC3R1.R7.4
-enable=MC3R1.R8.1
-enable=MC3R1.R8.2
-enable=MC3R1.R8.3
-enable=MC3R1.R8.4
-enable=MC3R1.R8.5
-enable=MC3R1.R8.8
-enable=MC3R1.R8.9
-enable=MC3R1.R8.10
-enable=MC3R1.R8.11
-enable=MC3R1.R8.12
-enable=MC3R1.R8.13
-enable=MC3R1.R8.14
-enable=MC3R1.R9.1
-enable=MC3R1.R9.2
-enable=MC3R1.R9.3
-enable=MC3R1.R9.4
-enable=MC3R1.R9.5
-enable=MC3R1.R10.1
-enable=MC3R1.R10.2
-enable=MC3R1.R10.3
-enable=MC3R1.R10.4
-enable=MC3R1.R10.5
-enable=MC3R1.R10.6
-enable=MC3R1.R10.7
-enable=MC3R1.R10.8
-enable=MC3R1.R11.1
-enable=MC3R1.R11.2
-enable=MC3R1.R11.3
-enable=MC3R1.R11.6
-enable=MC3R1.R11.7
-enable=MC3R1.R11.8
-enable=MC3R1.R11.9
-enable=MC3R1.R12.1
-enable=MC3R1.R12.2
-enable=MC3R1.R12.3
-enable=MC3R1.R12.4
-enable=MC3R1.R12.5
-enable=MC3R1.R13.1
-enable=MC3R1.R13.2
-enable=MC3R1.R13.3
-enable=MC3R1.R13.4
-enable=MC3R1.R13.5
-enable=MC3R1.R13.6
-enable=MC3R1.R14.1
-enable=MC3R1.R14.2
-enable=MC3R1.R14.3
-enable=MC3R1.R14.4
-enable=MC3R1.R15.2
-enable=MC3R1.R15.3
-enable=MC3R1.R15.4
-enable=MC3R1.R15.7
-enable=MC3R1.R16.2
-enable=MC3R1.R16.4
-enable=MC3R1.R16.5
-enable=MC3R1.R16.6
-enable=MC3R1.R16.7
-enable=MC3R1.R17.2
-enable=MC3R1.R17.3
-enable=MC3R1.R17.4
-enable=MC3R1.R17.5
-enable=MC3R1.R17.6
-enable=MC3R1.R17.7
-enable=MC3R1.R17.8
-enable=MC3R1.R18.1
-enable=MC3R1.R18.2
-enable=MC3R1.R18.3
-enable=MC3R1.R18.4
-enable=MC3R1.R18.5
-enable=MC3R1.R18.6
-enable=MC3R1.R18.7
-enable=MC3R1.R18.8
-enable=MC3R1.R19.1
-enable=MC3R1.R19.2
-enable=MC3R1.R20.1
-enable=MC3R1.R20.2
-enable=MC3R1.R20.3
-enable=MC3R1.R20.4
-enable=MC3R1.R20.5
-enable=MC3R1.R20.6
-enable=MC3R1.R20.7
-enable=MC3R1.R20.8
-enable=MC3R1.R20.9
-enable=MC3R1.R20.10
-enable=MC3R1.R20.11
-enable=MC3R1.R20.12
-enable=MC3R1.R20.13
-enable=MC3R1.R20.14
-enable=MC3R1.R21.1
-enable=MC3R1.R21.2
-enable=MC3R1.R21.3
-enable=MC3R1.R21.4
-enable=MC3R1.R21.5
-enable=MC3R1.R21.7
-enable=MC3R1.R21.8
-enable=MC3R1.R21.9
-enable=MC3R1.R21.10
-enable=MC3R1.R21.11
-enable=MC3R1.R21.12
-enable=MC3R1.R21.13
-enable=MC3R1.R21.14
-enable=MC3R1.R21.15
-enable=MC3R1.R21.16
-enable=MC3R1.R21.17
-enable=MC3R1.R21.18
-enable=MC3R1.R21.19
-enable=MC3R1.R21.20
-enable=MC3R1.R22.1
-enable=MC3R1.R22.2
-enable=MC3R1.R22.3
-enable=MC3R1.R22.4
-enable=MC3R1.R22.5
-enable=MC3R1.R22.6
-enable=MC3R1.R22.7
-enable=MC3R1.R22.8
-enable=MC3R1.R22.9
-enable=MC3R1.R22.10
-doc_end

-eval_file=common_config.ecl

-reports={hide,all_exp_external}