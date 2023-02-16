Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143B27B
	for <distributions@lists.linux.dev>; Thu, 16 Feb 2023 01:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=paN7ai0VzD2Z1bGvUQk6lQa43szHWVz++bkiWqAkoj0=; b=C+
	Gi89A/65hTcKlmtDOvOZO0hQKGQjA+Ed4r1UdLlXbriyIqb08ma5J/yn/an/PqQh2G7Ubb2BtgnYU
	bUVOv7GlYpio/5FSZ3vZp8iUTlxrXrxbD95jtCmvo4QMj3P2QNu0SaLo2WyMg3sQs7BWXHyTUShqG
	pPaHBcyQA0e7llNMcI8MngqOTBMVWs+oKirY0VLQV3bbBBfUSh8SU3FHi+F00JE5buxNzz2Sm1J2a
	NZ56DWJs8ZoZCCYcTY3jTDrzHaRRx5kjAIH2DpgX1+mPRWKrfWYXxnGa5GOhbX2ATeAMSrZvy2tw+
	Njg41Mll13Fi8Q8ajPFKYYOvWgnREZlw==;
Received: from guillem by master.debian.org with local (Exim 4.94.2)
	(envelope-from <guillem@master.debian.org>)
	id 1pSTFR-007O0v-Fs; Thu, 16 Feb 2023 01:39:45 +0000
Date: Thu, 16 Feb 2023 02:39:44 +0100
From: Guillem Jover <guillem@debian.org>
To: distributions@lists.linux.dev
Cc: distributions@lists.freedesktop.org
Subject: Distributions coordination lists
Message-ID: <Y+2JYG5pYyyG1CG0@thunder.hadrons.org>
Mail-Followup-To: Guillem Jover <guillem@debian.org>,
	distributions@lists.linux.dev, distributions@lists.freedesktop.org
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

I just noticed this new distributions coordination list:

  https://subspace.kernel.org/lists.linux.dev.html

Which seems to have already close to 80 participants. Although there
was already a list that seems had the exact same purpose at:

  https://lists.freedesktop.org/mailman/listinfo/distributions

With around 280 participants. I think it would be nice to avoid
fragmentation for this kind of coordination efforts?

(In any case I've subscribed to the new list too for now.)

Thanks,
Guillem
