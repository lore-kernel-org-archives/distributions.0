Received: from helios.lossy.network (helios.lossy.network [159.69.86.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448D1D2F1
	for <distributions@lists.linux.dev>; Wed, 12 Jul 2023 23:20:20 +0000 (UTC)
Message-ID: <075a20b1-869b-78f3-9ace-e106a4d43ac4@linuxlounge.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxlounge.net;
	s=mail; t=1689203423;
	bh=jaRHwfiX7UOAZRhLpqEgt4SuNirg6MOUDHm3XW7sGiU=;
	h=Date:To:From:Subject;
	b=UO7ajr8w6vwAyRnfZYxOJ4jNSKozm8guyq5LYNl8g/sWShvrnew3mP8zWg9uyVa+U
	 88PC2yhTLNa2/DE81mymV5tMpM0p+rvIb9M4BkDHE/4B44m5VcWafh8tJhnoXSULgj
	 6BkD2kDfzXxNA06BD556jcGFerQA5p2lzns3OEA8=
Date: Thu, 13 Jul 2023 01:10:21 +0200
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Language: en-US
To: distributions@lists.linux.dev
From: Martin Weinelt <martin@linuxlounge.net>
Subject: Thunderbird 115.0 regression with system icu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thunderbird 115.0 when used --with-system-icu breaks the calendar, since 
calendar events aren't rendered properly in some(?) timezones.

The vendored version of icu carries a patch (since Firefox 107), that 
hasn't made it upstream yet.


Bug: https://bugzilla.mozilla.org/show_bug.cgi?id=1790071
Bug: https://unicode-org.atlassian.net/browse/ICU-22132
Patch: https://hg.mozilla.org/mozilla-central/rev/fb8582f80c55


hexa
