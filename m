Received: from mail.cs.ucla.edu (mail.cs.ucla.edu [131.179.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2FA14F125
	for <distributions@lists.linux.dev>; Thu,  5 Sep 2024 18:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=131.179.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725560436; cv=none; b=azvP7L8Ao5YKDGSdrktwA6inGkSzoYo6aMkqeklMOMqtCpeYFHyEyDLadLxLF82Gzx1hHQ6/wZfkqGl8PGeGyvDJLHy056BdrYkaf1c5nLA5lf8sX874LJJ5phoSriJLzJBeIUKfwmDGEjM2+Hyvl3zStnJ6ugRQSSQcGT3r4JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725560436; c=relaxed/simple;
	bh=SeEQZmSZsoo/6l6ZpKgZR2m4WmfGXj456Y834fVa1Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKKpX53zur1NTgIi/PlmqFmlOnDQ8aNezGL652Xr3qZQzaB/cLgFscOrcVOoLFAi0RZvbm0/pOJfhJPiemBkX6Fxj+qlpNu7GxaUWtXQh8AbsxvQc1gdVl7CQsjrFgAeT5d0w4Pghu4wZmD9UQ/uAvblyS875GbH4LGqUB2fkF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu; spf=pass smtp.mailfrom=cs.ucla.edu; dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b=RJ6Or96Z; arc=none smtp.client-ip=131.179.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.ucla.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.ucla.edu header.i=@cs.ucla.edu header.b="RJ6Or96Z"
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id DEB9A3C09FC93;
	Thu,  5 Sep 2024 11:20:33 -0700 (PDT)
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10032) with ESMTP
 id FpZ1e2XcecPD; Thu,  5 Sep 2024 11:20:33 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.ucla.edu (Postfix) with ESMTP id 900BA3C09FC95;
	Thu,  5 Sep 2024 11:20:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.cs.ucla.edu 900BA3C09FC95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.ucla.edu;
	s=9D0B346E-2AEB-11ED-9476-E14B719DCE6C; t=1725560433;
	bh=mGfnYbZ0u8PM8OWOS/czmO7ay4pMHCOeDhW2RhAePzY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=RJ6Or96Zl+T5EL/ujrdOG/v2M9g2hTA8ZGn3/DmYO89Tq/P5+v17SULqnrovVx0i2
	 yAYq1G9XNBXpaMiJGIKp3TlaQf3fwmXSQi7eDt46H+AosfD5QlcGaPVq6xd4pjlEIJ
	 8HiwAoj8WilPcrsDcoWlUOETWWTeLr/hyOHu8UOtfdCX9szayNfiV3hOSiZdde9xgf
	 3QcRjnRnCcwmrO5hOX9MpmjFZbr0bkja2N3vO6LpVCaXpdaYxrOBphxzYLGVczJO5B
	 BoptS7O+jUjIv3O9X0us/osyN/cFIybY6wShZOWc15KYxZlzA+hXMVvBzZVo/pVqSS
	 559iqcbYIjdCw==
X-Virus-Scanned: amavis at mail.cs.ucla.edu
Received: from mail.cs.ucla.edu ([127.0.0.1])
 by localhost (mail.cs.ucla.edu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id qTyfnIZ3U1FN; Thu,  5 Sep 2024 11:20:33 -0700 (PDT)
Received: from [192.168.254.12] (unknown [47.150.137.250])
	by mail.cs.ucla.edu (Postfix) with ESMTPSA id 5453B3C09FC93;
	Thu,  5 Sep 2024 11:20:33 -0700 (PDT)
Message-ID: <edbc4f0b-69bc-4c93-a46a-0e3cf2d82b3e@cs.ucla.edu>
Date: Thu, 5 Sep 2024 11:20:32 -0700
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposed CHOST change for the 64bit time_t transition
To: "Andreas K. Huettel" <dilfridge@gentoo.org>, Wookey
 <wookey@wookware.org>, Khem Raj <raj.khem@gmail.com>
Cc: libc-alpha@sourceware.org, binutils@sourceware.org, gcc@gcc.gnu.org,
 config-patches@gnu.org, distributions@lists.linux.dev,
 devel@lists.fedoraproject.org, glaubitz@debian.org, maskray@google.com,
 dickey@invisible-island.net, toolchain@gentoo.org
References: <4996568.GXAFRqVoOG@noumea> <3848277.MHq7AAxBmi@noumea>
 <6e8dadbc-7ae2-465f-b8f6-d0d62507a191@cs.ucla.edu>
 <2015989.tdWV9SEqCh@noumea>
Content-Language: en-US
From: Paul Eggert <eggert@cs.ucla.edu>
Organization: UCLA Computer Science Department
In-Reply-To: <2015989.tdWV9SEqCh@noumea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-05 10:03, Andreas K. Huettel wrote:
> at least time64 implies largefile, so that will get sorted as side
> effect.

Right, but this means the "t" in "t64" is somewhat misleading, as it's 
not just about time: it also affects off_t, ino_t, etc., effects that 
are in some cases more important than the time_t effects. It may well be 
a good idea to use a different suffix, to remind non-experts about these 
other issues. How about "wsi" for "wider system integers"? E.g., 
i686-pc-linux-gnuwsi.

Is the plan to call these APIs XXXt64 or XXXwsi forever, even after the 
year 2038? For example, will i686-pc-linux-gnu be withdrawn in a few years?

How would you deal with the problem that i686-pc-linux-gnu would mean 
one thing in Gentoo and something else in Debian? (This was what I was 
hinting at when I suggested adding a suffix for 32-bit time_t instead of 
for 64-bit.)
