program lab7_1;

{$APPTYPE CONSOLE}
{$R *.res}

Uses SysUtils;

Const
  abc = 'abcdefghijklmnopqrstuvwxyz';
  vowel = ['a', 'e', 'i', 'o', 'u', 'y'];

Var
  st, endword, word, st2: string;
  i: integer;

begin
  write('Введите строку: ');
  readln(st);
  st := trim(st);
  for i := 1 to length(st) do   // loopA
  begin
    while ((st[i] = ' ') and (st[i + 1] = ' ')) do   // loopB
      delete(st, i + 1, 1);
  end;
  st2 := copy(st,1,length(st));
  for i := 1 to length(st2) do    // loopC
  begin
    if st2[i] in vowel then
      delete(st2, i, 1);
  end;
  if st2='' then writeln ('Пустая строка')
  else begin
  Writeln('Строка, без гласных букв: ');
  Writeln(st2);
  end;

  while length(st) > 1 do          // loopD
  begin
    word := Copy(st, 1, Pos(' ', st) - 1);
    delete(st, 1, Pos(' ', st));
    if (word <> endword) and (Pos(word, abc) = length(abc) - length(word) + 1)
    then Write(word, ' ');
    word:=word+' '+word;
  end;
  if word='' then  writeln ('Пустая строка')
   else begin
  Writeln('Слова, совпадающие с конечным отрезком латинского алфавита: ');
  Writeln(word);
  end;


  readln;
end.
