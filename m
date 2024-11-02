Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED5A249F9
	for <distributions@lists.linux.dev>; Sat,  2 Nov 2024 02:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730514031; cv=none; b=jD0iSj7r0xI/gDjeIe24MbadxsWvXcRJ0mBzZYi6Fgrt0SpjdBvmrkuOW3hNrZ03H/mZVcljKi0We1K6wPbDGuQVh0MWiH7C3pI1KyTktgxIZMbbEEZy6Hnwu2XHdPkj0dKYxn3chKe5/0g99fwaCkdwzpVQZBR4kFaFginvZ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730514031; c=relaxed/simple;
	bh=4jhAPrhn/c9zwsU6HpfBZSdDVTggUZJfR+uBALF6a50=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=C3DIo0vjwS26xVRa/XGRyHHVau88EYxtyWP9NJT6+WA/2d86c/Mbci3tnHqUIlsJvlzVuMUruOXSkZ2/Mpu9yLgAUVZE1on6lYNyqOKW1T7IeNS+Wk9SNz9B3jeaESsOPEVFz65ppxV4So/jHOYB5HrzVWMFxjKkX+ZiRBsX/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Message-ID: <b3301585-dc2b-4a8b-aa0b-2d9cea3d9e05@gentoo.org>
Date: Sat, 2 Nov 2024 12:20:25 +1000
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: distributions@lists.linux.dev
From: Matt Jolly <kangie@gentoo.org>
Subject: Chromium 130 and 131 Linux tarballs.
Autocrypt: addr=kangie@gentoo.org; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

The upstream Chromium project are currently having some issues with
their CI resulting in tarballs for the Stable and Beta channels running
quite late[1].

As the risks associated with having web-browsers with known Critical
CVEs deployed to users being too high for my comfort I've elected
to begin publishing tarballs for these releases until the CI catches up.

These can be found in the following S3 bucket. I'm supplying the hosting
for this; please be conscious of the bandwidth usage (i.e. please mirror
if you're serving to users). The Gentoo CDN may be faster for users
outside the region, please don't abuse it.

* https://chromium-tarballs.syd1.digitaloceanspaces.com/
* https://chromium-tarballs.distfiles.gentoo.org/

I will continue publishing tarballs until upstream's CI has caught up,
and I'll put some work into automating the process so that they're a
bit more timely.

The Dev channel seems to have been fixed however that
was after this week's release. If it's still not publishing next week 
I'll put up a tarball for 132.

If you'd prefer to make your own tarballs the process is relatively
straightforward. I've done up some brief documentation on the Gentoo
Wiki[2].

Have a great weekend.

Cheers,

Matt

1: 
https://groups.google.com/a/chromium.org/g/chromium-packagers/c/wjv9UKg2u4w
2: 
https://wiki.gentoo.org/wiki/Project:Chromium/How_to_make_a_Chromium_tarball
