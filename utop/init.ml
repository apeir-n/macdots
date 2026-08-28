#edit_mode_vi;;
#require "lambda-term";;
let prompt = LTerm_text.(eval [B_fg (LTerm_style.green); S "~~> "]);;
UTop.prompt := fst (React.S.create prompt);;
(* UTop.set_show_box false *)
