## IPSec Extended Sequence Number (ESN) support ##

Contact: Grzegorz Jaszczyk <jaz@semihalf.com>  
Contact: Patryk Duda <pdk@semihalf.com>  
Contact: Marcin Wojtas <mw@semihalf.com>  

Extended Sequence Number (ESN) is IPSec extension defined in [RFC4303 Section 2.2.1](https://tools.ietf.org/html/rfc4303#section-2.2.1).
It makes possible to implement high-speed IPSec implementations where standard, 32-bit sequence number is not sufficent.
Key feature of the ESN is that only low order 32 bits of sequence number are transmitted over the wire.
High-order 32 bits are maintained by sender and receiver. Additionally high-order bits are included in the computation of Integrity Check Value (ICV) field.

Extended Sequence Number support contains following:

  * Modification of existing anti-replay algorithm to fulfil ESN requirements.
  * Trigger soft lifetime expiration at 80% of UINT32\_MAX when ESN is disabled.
  * Implement support for including ESN into ICV in cryptosoft engine in both
    encrypt and authenticate mode (eg. AES-CBC and SHA256 HMAC) and combined
    mode (eg. AES-GCM).
  * Implement support for including ESN into ICV in AES-NI engine in both
    encrypt and authenticate mode and combined mode.

Completed since the last update:

  * Adjust implementation of crypto part to the reworked Open Crypto Framework.
  * Move the core ESN implementation from the crypto drivers to netipsec layer.
  * Make use of the newly introduced crp_aad mechanism for combined modes.
  * Introduce minor fixes and improvements.

Todo:

  * Complete review proces in Phabricator and merge patches in the tree.

Sponsor: Stormshield

