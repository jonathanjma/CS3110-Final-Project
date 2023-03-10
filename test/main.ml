open OUnit2
open Interp
(* open Ast *)
open Main


let id x = x

let parse_int_expression_test n eo i = 
  n >:: (fun _ -> assert_equal (string_of_int eo) (interp i) ~printer:id ) 
let tests = [
  parse_int_expression_test "0 should parse to 0" 0 "0";
  parse_int_expression_test "6 should parse to 6" 6 "6";
  parse_int_expression_test "2+3 should parse to 5" 5 "2+3";
  parse_int_expression_test "5 fk 9 should parse to 12" 12 "5 fk 9";
  parse_int_expression_test "2 + 3 * 10 should parse to 32" 32 "2+3*10";
  parse_int_expression_test "2 * 10 + 2 should parse to 22" 22 "2*10+2";
  parse_int_expression_test "2 * (10 + 2) should parse to 24" 24 "2 * (10 + 2)";


]

let _ = run_test_tt_main ("suite" >::: tests)

