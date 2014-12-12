<h1>Encryption and Decryption, lets see how far this goes!</h1>

  <h3>Details:</h3>
  
  - All previous version files are available, ex myencrypt_1.0.2.pl ect..
  
  - CryptoCan.pl is the latest version, files previous to version 1.0.3, aren't "public" friendly.
  
- Encryption using chr() ord() & base64, a bit of weird regex and of course some arrays.
- Perl Modules required:

    <strong>MIME::Base64::Perl;</strong> # or MIME::Base64;
    
    <strong>Math::BigInt;</strong> # Stopping large numbers from turning into scientific notation
    
    <strong>Term::ANSIColor;</strong> # Optional, mainly used for font coloring when running in command line(will need to edit code if you are not going to use this module).
    
    <strong>File::Slurp;</strong> # When decrypting, for reading the encrypted & pre-encrypted file.
  

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

    For Example: (This is using encryption on latest version, older versions may encrypt slightly differently)
      
      Before encryption $string = "Hello There!"; # length() = 12; 
      
      After Encryption with $key = "qIecf0"; # encrypted length() = 6760; # Massive!!!

<h3>Version Differences & Info</h3>
<b>(Newest down to oldest)</b>

<b>Newest version is named "CryptoCan.pl". Previous versions & names are bellow. As of December 11th 2014, will begin to date versions, rather than give each version a number.</b>

<b>December 11 2014</b>
- It's been awhile seen this project has been touched, although a new feature has been added, besides now having date stamps on version history, only version 1.0.0 - 1.0.5 will be kept in the "versions" directory. CryptoCan.pl will now be the only pushed file.
- User can now choose whether he/she wants to encrypt an entire file's contents, or a simple string they would type in. 
- Removed some ugly coding from 1.0.5, especially dependencies on Lingua.
- Lingua and other dictionaries were going to be used in 1.0.5 and future versions after that point, although from this version on foward, I hope not to be using any dictionaries of any sort. I had that idea in mind with Lingua, though later had realized it just made the script more bulky in dependencies and wouldnt have that much of an 'encrypted' affect I hoped it would.
- IV was meant to be implemented in this version, although the original way I had percieved it now comes to mind as rediculous. Rethinking IV encryption.

<b>Version 1.0.5</b>
- If a user inputs a too-large Key to use, the script will issue a warning rather then kill the entire proccess's.
- Slightly changed use of "Key" making the encoded, encrypted file content sections look different rather than a repeating. # still needs work. Appears as a "random-pattern" now, rather than "repeating" same base64 sequence in previous versions.
- Some other smaller changes.
- Contains "use Lingua::EN::Numbers qw(num2en num2en_ordinal);" on line 5. Systems will not have this module installed by default. Will need to manually install, OR remove line 5 in all, it is not specifically used for anything as of version 1.0.5.
- FIXED easy "crackable" encryption key in previous versions, this is only a "quick-fix". By using GCF (Greatest common factor) of the decoded data, put into an array, for each "data line". That GCF is the Raw Key.


<b>Version 1.0.4</b>
- Was accidentally released before 1.0.5, 1.0.5 was meant to be this version.
- Only slight differences exist.
- Removed .txt file extension of encrypted files. (No file extension now). Will need to right click and "open with" some text editor ect...
- WARNING: The encryption KEY in this version is easily "crackable"!

<b>Version 1.0.3</b>
- First real "public" release.
- Contains a walkthrough on how to use through command line.
- WARNING: The encryption KEY in this version is easily "crackable"!
