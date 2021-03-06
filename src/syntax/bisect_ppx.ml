(*
 * This file is part of Bisect.
 * Copyright (C) 2008-2012 Xavier Clerc.
 *
 * Bisect is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * Bisect is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *)

let () =
  Ast_mapper.run_main (fun argv ->
    let anon s = raise (invalid_arg ("nothing anonymous: " ^ s)) in
    let usage = Printf.sprintf "Usage: bisect_ppx <options>" in
    let arga = Array.of_list ("" :: argv) in
    Arg.parse_argv arga InstrumentArgs.switches anon usage;
    let instrumenter = new InstrumentPpx.instrumenter in
    Ast_mapper_class.to_mapper instrumenter)
