type render_fix =
  Lang.t ->
  Metavariable.bindings ->
  fix_pattern:string ->
  target_contents:string lazy_t ->
  string option

(* Can return an Error because when have a NoTokenLocation exn when
 * trying to get the range of a match or metavar.
 *)
val match_to_match :
  render_fix option ->
  Pattern_match.t ->
  (Output_from_core_t.core_match, Semgrep_error_code.error) Common.either

val match_results_of_matches_and_errors :
  render_fix option ->
  int (* number of files processed, for the stats.okfiles *) ->
  Report.final_result ->
  Output_from_core_t.core_match_results

(* for abstract_content and subpatterns matching-explanations
 * TODO: should not use! the result may miss some commas
 *)
val metavar_string_of_any : AST_generic.any -> string

(* internal *)
val match_to_error : Pattern_match.t -> unit
