Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E2713FFF
	for <distributions@lists.linux.dev>; Wed, 17 Jan 2024 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.121.71.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705502405; cv=none; b=OUTQE0Q9PvNrO/aeESg00B/iHx01HmorRVm3/g0k8liQlt1qF0rPwpL2hJ6A+JjGDvKBuZ59pt6nrTWqCA0zGVoalp4LcxNbd/+mwj5KRHQcohMgsS8XGCIvG8BH2+p0ssjxs2h3x9iHlTUjyr6FbH+gm0GyFvW57m8Eq+Mejro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705502405; c=relaxed/simple;
	bh=GvHX1ufCqucHtnmyFgVVUm+BPUVFHqwVKd1TXtGsPoI=;
	h=Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Content-Disposition; b=OyQdR5jzgbicAXCWcyEqy0vxgVb3N/BjGkwt99/cpafbi/mYKkSnOhcTRb8q05c62mrjaTPNyNEWdOhBbgX1nzirwUQyiR2B8oexx5ala9zRRv63fTrdY/D0xb+SZTYAGoEQRULMVo9qNlRfFD48tNHYSjYHtRg1B/3pDuXkmLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notk.org; spf=pass smtp.mailfrom=notk.org; arc=none smtp.client-ip=91.121.71.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=notk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=notk.org
Received: from smtp.notk.org (nautica.notk.org [91.121.71.147])
	by nautica.notk.org (Postfix) with ESMTPSA id 7D774C009
	for <distributions@lists.linux.dev>; Wed, 17 Jan 2024 15:39:54 +0100 (CET)
Date: Wed, 17 Jan 2024 15:39:54 +0100
From: Adrien Nader <adrien@notk.org>
To: distributions@lists.linux.dev
Subject: Openssl release schedule
Message-ID: <20240117143954.jnddbydyra7hftdc@notk.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

I just opened an issue on openssl/general-policies related to openssl's
release schedule: https://github.com/openssl/general-policies/issues/60

The core idea is that it would be helpful for distributions to have
openssl LTS releases every two years while releases every six months
that are supported for two years are less useful and probably still a
burden for maintainers.

Subscribers to this list might be interested in weighing on this issue,
especially regarding the match of openssl release schedule and your
distribution's.

The immediate practical concern for Ubuntu is that we will have to use
openssl 3.0 for our upcoming 24.O4 LTS. The same issue will most likely
arise for 28.04 too. I expect the same to apply to other distros as
well.

-- 
Adrien
