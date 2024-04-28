Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D363210A3B
	for <distributions@lists.linux.dev>; Sun, 28 Apr 2024 23:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345687; cv=none; b=f6SI7Gi1bGrjoyGCf5UqpTO+PpKqYpgaQMxn2uTzUD6foppgOzjsh2cuZsUEYNJnDUEAHx/Iay+xqEemhkUHEOMca9w9C58c9N6P0LoBO3/hvqNf90kaYy9oPl5V8z45EFjnISFXmlO7Nj6eY8pMZIeoylfLN+1gCzcLflhLI1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345687; c=relaxed/simple;
	bh=8a3hC0rsWXFOU/hOPvZh6iavhQhtH7Z2/cRGE3mPGa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sKysMLmbPhO2fX0UJ/nqyvOXiz1Oa49drn45D2PU2olbRh2qXKIx696Re2j7wURpVmJrX0AIhIaOD1n6thsDHOg5qCxTnLBb+NONpthST+Xl2rPcyBGZkeAbdDsi90GGJppM1xyMxj5B5Gy73xLdE2Wo72r3NmRKp9wTQ7AKfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: distributions@lists.linux.dev
Cc: Hanno =?utf-8?Q?B=C3=B6ck?= <hanno@gentoo.org>
Subject: grep-3.11 regression on large directories
Organization: Gentoo
User-Agent: mu4e 1.12.4; emacs 30.0.50
Date: Mon, 29 Apr 2024 00:08:02 +0100
Message-ID: <87v8416q7h.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

Hanno B=C3=B6ck brought to my attention that grep-3.11 has a regression
on large directories.

This was fixed a year ago but hasn't yet propagated into a release.

(Maybe everyone else had already found out about this, but I didn't know
until now, so hopefully this helps someone else too.)

Bug: https://bugs.debian.org/1041588
Bug: https://debbugs.gnu.org/64773
Bug: https://bugs.gentoo.org/930825
Patch: https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=3Dd4d8abb39e=
b02c555f062b1f83ffcfac999c582f

thanks,
sam
