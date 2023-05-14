Received: from kurisu.lahfa.xyz (kurisu.lahfa.xyz [163.172.69.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B83ED1
	for <distributions@lists.linux.dev>; Sun, 14 May 2023 18:51:11 +0000 (UTC)
Date: Sun, 14 May 2023 20:50:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lahfa.xyz; s=kurisu;
	t=1684090257; bh=54oqEDrT8L6l6Eai2L5qM6tCLsImwwlhjRUqW4BBu1g=;
	h=Date:From:To:Cc:Subject;
	b=GlOIcaoPkj0ePLDrYmwAZ/0Xczp0c/1GygZc3OHfNdnPmHsbF5Vss5bEAbzDo+uMQ
	 yxPyxTns2csrAz7X1kbudW5aVRw5JeeBwVzbXxcAPqQiypnmlLWUvyLxAuLrcwpGx5
	 ofsRR1mNDKhilEl0DtMkpCVrJXB+X1sITIpcxf8w=
From: Ryan Lahfa <ryan@lahfa.xyz>
To: distributions@lists.linux.dev
Cc: hexa@darmstadt.ccc.de
Subject: OpenSSL 3.x and Ruby 3.0.y
Message-ID: <ugny5rbd4g3nuge7yuyhygqgb343eflqwavht2wmkp5oradoeq@2nat6bpbmsbz>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi there,

Ruby 3.0.x decided to not support OpenSSL ≥ 3 in their tree.
Though, it seems like many services like Gitlab are still compatible
only with Ruby 3.0.x.

A solution (which I think was found out also by Fedora?) consist into
installing the OpenSSL gem version ≥ 3.

We do it by replacing the `$ruby-tree/ext/openssl` directory in this way
in NixOS: https://github.com/NixOS/nixpkgs/pull/231899/files#diff-c1d18e0554429e0b48c20c01ef94191fa75ba3ef6e057b5b9e3c40dde0c2b64bR158-R163

FWIW, Ruby 3.0.x will be supported for the next 10 months, Ruby 3.1 do
not have this problem.

Kind regards,
-- 
Ryan Lahfa,
NixOS release manager for 23.05, 23.11
