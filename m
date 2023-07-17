Received: from kurisu.lahfa.xyz (kurisu.lahfa.xyz [163.172.69.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B7C2C2
	for <distributions@lists.linux.dev>; Mon, 17 Jul 2023 18:32:37 +0000 (UTC)
Date: Mon, 17 Jul 2023 20:23:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lahfa.xyz; s=kurisu;
	t=1689618189; bh=Pq7MYwXmhQygHLjOtwPYZ8yM7zPHfJNEMgsV34NRZC0=;
	h=Date:From:To:Cc:Subject;
	b=cePZxkscV7+p3ZIcjL2diUQf37TMpqjzWToCul04kqyyippwKfVyOztHj35FaW1Eo
	 zFe19apESoDTPUCndQnhg6Y1j3cpZrvnDUWqwAC422Ra6oqPbThZ7eAiNx6k9XHJzM
	 ZRmJFyoO/fyeY6bbsg4sLg6TT9gXp5oMci3zlcNA=
From: Ryan Lahfa <ryan@lahfa.xyz>
To: distributions@lists.linux.dev
Cc: lorenz@brun.one
Subject: Heads-up on Chromium M115+: Rust is a dependency
Message-ID: <ryjfql3ysicyyj64kgog3ipfys2skjddtmlsgdm3tcavvdt2xr@7cowkh32khr2>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello there,

Through this
https://security.googleblog.com/2023/01/supporting-use-of-rust-in-chromium.html,
we noticed that Chromium M115+ ships with a bundled binary Rust compiler
now, this may be of interest for distribution who want to assert control
over the Chromium toolchain.

We replaced it in
https://github.com/NixOS/nixpkgs/pull/243319 in NixOS.

M115 do not ship with production Rust code, so we do not know yet if our
approach is valid.

Kind regards,
-- 
Ryan Lahfa, NixOS developer
