program VerifyExercises;

{$mode objfpc}

uses sysutils, process;

var
   execdir  : string;
   rootdir  : string;
   workdir  : string;
   FileInfo : TSearchRec;
   slugs    : array of string = ();
   i        : integer;
   stdout   : ansistring;

begin
   execdir := ExtractFilePath(ParamStr(0));
   rootdir := ExpandFileName(ConcatPaths([execdir, '..']));
   workdir := ConcatPaths([rootdir, 'exercises', 'practice']);
   SetCurrentDir(workdir);

   If FindFirst ('*', faDirectory, FileInfo) = 0 then
   begin
      Repeat
         With FileInfo do
         begin
            If (Attr and faDirectory) = faDirectory then
               if (Name <> '.') and (Name <> '..') then Insert(Name, slugs, 0);
         end;
      Until FindNext(FileInfo) <> 0;
      FindClose(FileInfo);
   end;

   for i := Low(slugs) to High(slugs) do
   begin
      SetCurrentDir(ConcatPaths([workdir, slugs[i]]));
      writeln('exercise: ', slugs[i]);
      if RunCommand('make', ['-k'], stdout) then writeln(stdout);
   end;

end.
