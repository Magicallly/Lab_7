program lab7;

{$APPTYPE CONSOLE}
{$R *.res}

uses SysUtils;

var
  s, str1: string;
  z, data: boolean;
  max_day, i, k, g, month, day, year: integer;

begin
  write('Введите строку: ');
  Readln(s);
  if length(s) = 10 then
  begin
    for g := 1 to 2 do    // loop A
    begin
      str1 := str1 + s[g];
    end;
    day := StrToInt(str1);
    delete(str1, 1, length(str1));

    for g := 4 to 5 do       // loop B
    begin
      str1 := str1 + s[g];
    end;
    month := StrToInt(str1);
    delete(str1, 1, length(str1));

    for g := 7 to 10 do     // loop C
    begin
      str1 := str1 + s[g];
    end;
    year := StrToInt(str1);

    data := (length(s) = 10) and (s[3] = '.') and (s[6] = '.') and (month >= 1) and (month <= 12);
    if data then
    begin
      case month of
        02:
          if (year mod 400 = 0) or ((year mod 4 = 0) and (year mod 100 <> 0))
          then
            max_day := 29
          else
            max_day := 28;
        04, 06, 09, 11:
          max_day := 30
      else
        max_day := 31
      end;

      data := (day >= 01) and (day <= max_day) and (month >= 1) and (month <= 12);
      if data then

        writeln('Вы ввели верную дату.')
        else writeln('Вы ввели неверную дату.')
    end
      else writeln('Вы ввели неверную дату.')

  end
  else
  begin
    k := 0;
    z := True;
    for i := 1 to length(s) do   // loop D
    begin
      if s[i] = '.' then
        inc(k);
      if not((s[i] in ['0' .. '9']) or (s[i] in ['.', '-'])) or (k > 1) or
        ((s[i] = '-') and (i <> 1)) then
        z := False;
    end;
    if z then
    begin
      writeln('Строка является числом.');
      if Pos('.', s) > 0 then
        writeln('Число вещественное.')
      else
        writeln('Число целое.');
    end
    else
      writeln('Строка не является числом!');
  end;

  Readln;

end.
