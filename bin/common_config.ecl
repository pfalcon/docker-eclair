-eval_file=toolchain.ecl

-eval_file=public_APIs.ecl
-public_files+=api:public


-doc="FIXME: cite the compiler manual section describing support for __asm__."
-config=MC3R1.R1.2,reports+={hide,"category(^STD.tokenext/__asm__$)"}

-doc="FIXME: cite the compiler manual section describing support for __attribute__."
-config=MC3R1.R1.2,reports+={hide,"category(^STD.tokenext/__attribute__$)"}

-doc="FIXME: cite the compiler manual section describing support for __typeof__."
-config=MC3R1.R1.2,reports+={hide,"category(^STD.tokenext/__typeof__$)"}

-doc_begin="Unless specified otherwise, a function with a non-const pointer argument is assumed not to read the pointee before writing it and it is assumed to write something to it before returning."
-default_call_properties+="pointee_read(1..=never)"
-default_call_properties+="pointee_write(1..=always)"
-doc_end


-doc="Unless specified otherwise, a function is assumed to not save/preserve the pointers received as arguments."
-default_call_properties+="taken()"
