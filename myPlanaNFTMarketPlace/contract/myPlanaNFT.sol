// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract myPlanaMarketplace is ERC721 {
    using Counters for Counters.Counter;

	Counters.Counter public tokenIdCounter;

    constructor() ERC721("PLANA", "PLN") {}

    function _baseURI() internal pure override returns (string memory) {
		return "https://ipfs.io/ipfs/";
	}

    function mintItem(address to, string memory uri) public returns (uint256) {
		tokenIdCounter.increment();
		uint256 tokenId = tokenIdCounter.current();
		_safeMint(to, tokenId);
		_setTokenURI(tokenId, uri);
		return tokenId;
	}

    function _safeTransferFrom(address from, address to, uint256 tokenId) internal {
        safeTransferFrom(from, to, tokenId, "");
    }

    function _tokenURI(uint256 tokenId) public view virtual returns (string memory) {
       return super.tokenURI(tokenId);
    }

    function burn(uint256 id) external {
        _burn(id);
    }
}