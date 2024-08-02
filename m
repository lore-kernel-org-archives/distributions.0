Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5941E212B
	for <distributions@lists.linux.dev>; Fri,  2 Aug 2024 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722600736; cv=none; b=DTKSVtbV5B2KOzuyMEwMYiALu3uvMliXdqAA470oGCH6DyuF0XmiFpTn6hO8Wylx+7UU8bkyEPzr+gLqN8MA0du2iXXAUxR/cV8Vz2V5wev5Oz3gaaKWtGKw4zd9d0zUQMJeKBIRnJMljIXA8SYjSyBCf7aV5J5tjV0zlMhXPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722600736; c=relaxed/simple;
	bh=GArJxe2ch8NaUVIrj+dGqbcmyg3Jb1JRoH5EpwYwad0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HUTQ55qHqaP6hOrq+EZDLZZqARgSrC+yefBguzc9Ut1BVEWR3vqcUzIXxK39qeILIJLopniIhyrv9vH9dRzw+nJ5pMeyEOmbLSdYNbbZX+Z48siXYHFpzFa9hu01c+ltuDmlW7KFfXT6lK9zLRxYPDwLchiWpQHjoEqApNWPvIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jJakLXfs; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jJakLXfs"
Received: from localhost (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4994640596;
	Fri,  2 Aug 2024 14:12:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBdHWIZHouQI; Fri,  2 Aug 2024 14:12:11 +0200 (CEST)
Date: Fri, 2 Aug 2024 20:11:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1722600731; bh=GArJxe2ch8NaUVIrj+dGqbcmyg3Jb1JRoH5EpwYwad0=;
	h=Date:From:To:Cc:Subject;
	b=jJakLXfsXwwJ6qxvsTXnmMSIBrYQdlpdrtypgjbYQYZQ1jpxdbFEheAegk6CJ3rBO
	 /C+vItcZP/VLO6VMTpYrn+lXeGoJ1K8XuRlmT2Z6flslrndLCHeqlOg6+93QvUlz3Z
	 bGOtbhCZGXj7htRaNVkYuxTDuQm/Y5b/3c3RnpdgRwg+VfmSajQ8Kv8Y9gBOynucNU
	 aj5bHcP3Oqg1GruDUxeD1KhJkWV3Pda6X/6Heb8Vlc96r2Lt9q1tWgJNBXLd8qxFQW
	 878ZrYOSdHt7XhL0xvx2V1gOc5HlwBuQI8aeKKC5xlyEHuUygC2LohYWnNFvfdgu8M
	 5R8kqzpEO7gXA==
From: Yao Zi <ziyao@disroot.org>
To: distributions@lists.linux.dev
Cc: Yao Zi <ziyao@disroot.org>
Subject: ABI breaking changes in OpenCC 1.1.8
Message-ID: <ZqzNBhiKRod6qFMM@ziyaolaptop.my.domain>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi list,

For the new release of OpenCC, 1.1.8, please note that this patch
release does break the ABI (prototype of Config::NewFromFile changed),
affecting packages like librime.

See also
 - https://github.com/BYVoid/OpenCC/issues/885

Best regards,
Yao Zi
