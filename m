Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C78B13FEE
	for <distributions@lists.linux.dev>; Wed, 17 Jun 2026 01:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781660946; cv=none; b=XTdXEkq0PFRnedTRdR4HuuYFr4a6wWohiGqWzbGKkPt3eCI8/r9mReWjaqrKMHWioMDsMQQ34GgJnGQ8KxefIUNDvA9VtZuKQw37sRzBYpBEH1ASLidznidbyxBotZkrZdrZOvlccGTA7xUOJK9MBW6QohEXBw3lO05TvIa15Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781660946; c=relaxed/simple;
	bh=FGyI95Yf3Sx48+aqkfbqmKuFl5y+QaQaXSNHg/3U+lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEQIzXTW1b00KqlsKE35jYzGtiCWYdMuvS6/3v6sumxHYfCMOhROADhY8qG/alfsluMj26mnPd+o+tWWYpjTLVsqjIpS64S4dpIIFuisfkpbvE0u0bc8Zw4f1NnjAa5e7KThudszIxJGtOzltHHQJ0GVTPCzSOgHxiPMVuIwXKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=master.debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=PmsVsJE3; arc=none smtp.client-ip=82.195.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="PmsVsJE3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=FGyI95Yf3Sx48+aqkfbqmKuFl5y+QaQaXSNHg/3U+lQ=; b=Pm
	sVsJE3mtFGWA76koEhScYUOdQRd+SuAoWHlustlPm6b4gbe1qxA/BQ6vSdtWgNxPEKZmg6TM1HW33
	MJG6anXkquHq4+NugMcDb6jKjp+8pPlATrbTATvyzRTueTt93WnDjgqq3szoKD8AGZbC3F8iDbVbW
	qWm9K6nzOMz9YbQZg17Z/UBRfDFB965Aw0kTDUewTqYRz0tzGRZM7/olz3meCE7mjuS9av0NYaSkI
	NcqwC2expkCuhZOwg4D2nsZ/o2YvdmngWHDtBvGoJpSn2EhrT2iQ1VIJwiUecqqrD4PYlx1XcGwNp
	9YGrSrp/LRfbOrNWYpTCh/RufdTQqvEQ==;
Received: from guillem by master.debian.org with local (Exim 4.96)
	(envelope-from <guillem@master.debian.org>)
	id 1wZfEN-007rur-0z;
	Wed, 17 Jun 2026 01:38:15 +0000
Date: Wed, 17 Jun 2026 03:38:14 +0200
From: Guillem Jover <guillem@debian.org>
To: distributions@lists.linux.dev
Cc: Jeff Moyer <jmoyer@redhat.com>
Subject: Upstream libaio moved from pagure.io to codeberg.org
Message-ID: <ajH6hjJ9X6PcLET3@thunder.hadrons.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Due to the decommission of the pagure.io site, the libaio upstream
project has recently moved from <https://pagure.io/libaio> to
<https://codeberg.org/jmoyer/libaio>. So this is a heads-up to update
references and release tracking to the new site. (I've done this for
Debian f.ex.)

Regards,
Guillem
