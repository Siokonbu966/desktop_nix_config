def --env inknb [notebook_id: string] {
  let note_path = (nb show --path $notebook_id)
  if ($note_path | is-empty) {
    print $"Error: Could not find item '($notebook_id)'"
    return
  }
  ink $note_path
}
