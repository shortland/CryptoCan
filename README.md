<h1>Encryption and Decryption, lets see how far this goes!</h1>

  <h3>Details:</h3>
  
  - All previous version files are available, ex myencrypt_1.0.2.pl ect..
  
  - myencrypt_1.0.5.pl is the latest version, files previous to version 1.0.3, aren't "public" friendly.
  
- Encryption using chr() ord() & base64, a bit of weird regex and of course some array.
- Perl Modules required:

    <strong>MIME::Base64::Perl;</strong> # or MIME::Base64;
    
    <strong>Math::BigInt;</strong> # Stopping large numbers from turning into scientific notation
    
    <strong>Term::ANSIColor;</strong> # Optional, mainly used for font coloring when running in command line(will need to edit code if you are not going to use this module).
    
    <strong>use File::Slurp;</strong> # When decrypting, for reading the encrypted file.
    
    <strong>use Lingua::EN::Numbers qw(num2en num2en_ordinal);</strong> # Module is not used specifically in 1.0.5, can be removed from top of the script. (Will be required in next version 1.0.6 most likey).

- This is a command line script.


<h3>Planned Updates</h3>
- Add a secondary Key
- Add different types of ways to deal with Key.
- Completely redo some parts of encryption, & add new techniques of mixing stuff up.
- Fix the problems listed.
- Create a seperate version [for CGI peoples as-well], which would be a module rather than (what it is currently) standalone script.

<h3>Problems</h3>
- Key length is set to a max of 6, at 8 length, encryption and decryption begins to fail as the length of encrypted data is drastically increased. Key Length of 6 seems to be "flawless".
- This encryption is extremely bulky, and gets extremely slow with large strings.

    For Example: (This is using encryption on version 1.0.3, newer version encrypt slightly different)
      
      Before encryption $string = "Hello There!"; # length() = 12; 
      
      After Encryption with $key = "g3PCWK"; # encrypted length() = 5720; # Massive!!!

<h3>Version Differences & Info</h3>
<b>(Newest down to oldest)</b>

<b>Version 1.0.5</b>
- If a user inputs a too-large Key to use, the script will issue a warning rather then kill the entire proccess's.
- Slightly changed use of "Key" making the encoded, encrypted file content sections look different rather than a repeating. # still needs work. Appears as a "random-pattern" now, rather than "repeating" same base64 sequence in previous versions.
- Some other smaller changes.
- Contains "use Lingua::EN::Numbers qw(num2en num2en_ordinal);" on line 5. Systems will not have this module installed by default. Will need to manually install, OR remove line 5 in all, it is not specifically used for anything as of version 1.0.5.

<b>Version 1.0.4</b>
- Was accidentally released before 1.0.5, 1.0.5 was meant to be this version.
- Only slight differences exist.
- Removed .txt file extension of encrypted files. (No file extension now). Will need to right click and "open with" some text editor ect...

<b>Version 1.0.3</b>
- First real "public" release.
- Contains a walkthrough on how to use through command line.

