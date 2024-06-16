Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1660D610D
	for <distributions@lists.linux.dev>; Sun, 16 Jun 2024 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.216
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718549359; cv=pass; b=eN3RZ7XDis0Qu9TRWtYfuGFmV3oeQ6VZba7XeOLSFa7y7rNBYQHCjw9KIeKgxkNaG5x4HeO/E3Dqza76LDUWwUU++gj02ijf54c7GWxj0Ci7hbvNM8Rj1dPw4r45cGc3CliwnbKLV8ZSbHQJkwZ6YpeDVbxZ5ySh5mm6jBElTQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718549359; c=relaxed/simple;
	bh=410oC8I4ziyX3BumMHp1yVJ/zqRTSanJ/0d4kwPQits=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibyDLwTTR5wM8eiS8gkzTlzYI/fiIGPZg4U+ItJbk7nmnCGBmptkLUohjd5fwLp3oR/bdACTsCtXRCewwhZbD5x4t16hk6nrY8rrASNMvA7Hngtp1hp5uwPwSBF73FQPKnh7EHaq3N3fjxqZXENDrOOcuWgZkCsI4QCT/wUZSuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org; spf=none smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=navqxUEG; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=LHCaUZCQ; arc=pass smtp.client-ip=81.169.146.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="navqxUEG";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="LHCaUZCQ"
ARC-Seal: i=1; a=rsa-sha256; t=1718549338; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MIT7PVM5ih2KIjFygj8jOvfXU/mUmX63bCnDRCWrlzzwLTVp+IfHpnY8yxjQxNHnGc
    MGa79pJO8xJMVupyPK0BVmV9VFoKLInMxyMbXzHvzOaGRgHzauI0KDR7J00gyYANrsAf
    1RFrqxDqr1VPw6XaRR5tpecN/xvdcXqbN0u5YYsPJv4Ke8ajg/xuPKTu93TdthdPpSSd
    znaR6GdckgioAYQQKorY6XkOoG/jeDtnf+LE/kFU71PxKhBVQv1h1s09b5sxG3DXHJx7
    eytBmfNXqm1/TttEQ9ImDe13ZytNGhGwjqaEVEFulx5SkGu28fbSCVI2kZwCr+mjELCK
    gb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1718549338;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=410oC8I4ziyX3BumMHp1yVJ/zqRTSanJ/0d4kwPQits=;
    b=ktOKI9JIXv36A2zBOzJJOx70X3t6rtGtf4tKrRYuMUiCDN4ZnXUlMWvKHYtwDVcoWQ
    vSSloqtFC9WkB3BWXkLokl/BfjG01UcHDm81xQpejEfG9tG0OW0wpUja8PDH9taLeKtC
    j6v1tyLh9WgYm9Ilupq+YObs/FZRzA53itNyr9u4iEHI1PLhf7sTwxy7FiCXuHsw5tp8
    4mQ0dw2669ZgmjscKTRsDkBaDI94Z5pJA1jJMqzp4RH5qN6+ZRNf1AkCUkkT3Hun4jmg
    WqZUsE6yRqcxC9FSAH+ch1EwBQzE+8YLgHl5sNG+DBWg1jdAh5r4SNYuSYIUpc0GAY3x
    X3tg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1718549338;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=410oC8I4ziyX3BumMHp1yVJ/zqRTSanJ/0d4kwPQits=;
    b=navqxUEGFpIiF3FGqrcB9rZCYP1AAr4rl5nSjGa6ZKH7SXfK/bd7/KUQBWai7NTE3Z
    34BrsSWxPI4aKbGItsm5afxJeJx9njYInyR2uZSw3nftWi7vcjs65UIMLAygyJ0mLFF2
    NPu1YR0leYD88nNjEWFohBDOtoO3dvhHaQ2fkkoWsgUxsm60jyn2UhefWlk8IPZiiky5
    ZzNerGJu5zGsRLDZDVai9ZfM+mD01esBjEtoOngjeNpwlBU7YtPqkS/ejFMQsrMWHWN6
    ZLg3QhYReFbhBkzFyQiZVrhB60zrzbjq4ScrQMclYA8Uwgz6tFdnFukQ2jGq6hbFvq7W
    5nuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1718549338;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=410oC8I4ziyX3BumMHp1yVJ/zqRTSanJ/0d4kwPQits=;
    b=LHCaUZCQE8hVjLeExMrI2C/+RGlIjjbfOfDYs4FXTQnjW6WSL4wFT476+B7slrh1sN
    wUGTDa/qDHmZfAK04DDw==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpPF2vEbQWeo9XCXXKo6QaGy+FFm"
Received: from nimes.localnet
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id N0957e05GEmwUX3
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 16 Jun 2024 16:48:58 +0200 (CEST)
From: Bruno Haible <bruno@clisp.org>
To: distributions@lists.linux.dev, "Andreas K. Huettel" <dilfridge@gentoo.org>
Subject: Re: packages released with libtool-2.5.0 likely fail to build on mips64
Date: Sun, 16 Jun 2024 16:48:58 +0200
Message-ID: <4353915.VTH2PmbeCk@nimes>
In-Reply-To: <3299713.44csPzL39Z@pinacolada>
References: <3299713.44csPzL39Z@pinacolada>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Andreas K. Huettel wrote:
> When a tarball has been generated with libtool-2.5.0, ...

Why would anyone do that? libtool-2.5.x are unstable (testing)
releases, distributed through alpha.gnu.org, not ftp.gnu.org.
Explicitly classified as an "alpha" release in the announcement [1].

Bruno

[1] https://lists.gnu.org/archive/html/libtool/2024-05/msg00006.html




