Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789131C9B97
	for <distributions@lists.linux.dev>; Thu, 23 Jan 2025 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737640435; cv=pass; b=r6g/GBougyGlMoy9rmxtewFbgWcwxspd8vp9gLh+9D3iv+W5/K3XKRhZFid02izQDqfUmZs6zpEf7CCbIH0P0yksW9bn8CT/iLp6vyoI0Q/zkaTtc8mNLiy3Btb/0YzlZFsRFcE72J+QXJIzfxwpMgXZBD9iLvlhdutMdiJYQCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737640435; c=relaxed/simple;
	bh=qW4e/7dPV6XTfEUvEgM1Wfajsej/rnSz/mPgP3KcMrE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MaCgQ9lkMYXKwhGyCfN49tKqisqyI7XDSqLPMQoZJmyx1jIf+crJLJbZwnAHY7Jzla6OklTVrigcZhISNQczfFxWSH4omcNjxE6BG2NH+0Md6hZW7TCOCwKM8yJupfgSU4CVYQjuZ5pQJvgKVPom2DUjkLVHt/3EWw+wm9w5nWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org; spf=none smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=jOh95SGP; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=lVT7mQW3; arc=pass smtp.client-ip=81.169.146.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="jOh95SGP";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="lVT7mQW3"
ARC-Seal: i=1; a=rsa-sha256; t=1737640246; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VNsp2Q+l9DPCOXHcQBZAqUuAEhuVfOKTvMhHZdthVmPJEl6s427rll3m9nnLRBJO87
    /7s3gjzhGkmzs5cv3F7iy/Aky2JYX7z+ve8N20jHvNOuMIw/echVCyFRGNxOZZX4khRk
    hvufzmNElGoXZGzWU5b1ao7DcXxC1dmvUlrxEcwBxG26msyD7T64jnRn153A2nbxYHlK
    oRfsCpli6HnCYORRCOqceXj2wyVBQkw29hxA4kYG9kJMa85MfUzSTjzGIqEPu9lzGYmE
    1N5B0KJZWR5tH1GgTcaSQrtPsU1obj8RTjUMghfjVURov9+CIakqzDv1BcR8jewgsk9Z
    IwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1737640246;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=qW4e/7dPV6XTfEUvEgM1Wfajsej/rnSz/mPgP3KcMrE=;
    b=JII5UPGFHtLvs7fDJaxRzQCNy7Gxuy3TvKWDocUsj5B0GUFnyJeDhaBL4FN1y3fV8T
    JkhJZxfiU7QfbqaYIIrY5PNuFy7oCUYmvTKo6HQUGeOfanDDkP3n2aUebSjBXRLjqU02
    jk89zazDYARwpEP3/kkNftfInxDMrDpmRuDxiU9fEQRBekvqmJ8RZCq6aMaL7+P0ZOXS
    E8s+UPmO9y3UfZDaPokH/yhxWOPiEfeR7BxyMnATVApBWBX8ZImspOto9kx5wkrv1XPs
    S5IPluH3+lPBY+ZW+oMtcyRVan1jsZqLUp5+nGoShDvcUL7j4571/kd39qMnExI0XtH5
    zfLQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1737640246;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=qW4e/7dPV6XTfEUvEgM1Wfajsej/rnSz/mPgP3KcMrE=;
    b=jOh95SGPSuQifkBNTog2igkLQGhTyCljRdLaD9hRFG4ydTyZQieHLos+Ci/F6Ty8L3
    jRuUj6gU8aZcE1yr0Nq25Rry8NZXo0EtObfWn8XWMsjcKm0CRFzZCWwcEEBhaYGSkD+v
    2nbrq/EB9lIs3qbzCECbisv4PXaFH2KokMjrpxsPRbeBe6ddG2cAL3sSspIHpm53cGyd
    4EXSfps08NSBaVbFn11BmzQmR2AzuR2EAW5gxGVVmLSc5m7oDKiElfn5dkLMr8RCPIPy
    8mULodWr7cxUKSvWbYAvbAMnubgsy0EUsi8WmglDYOjSgrUN7pvbcYwQlsBhYdfjXmhQ
    h7xw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1737640246;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:Date:From:
    Subject:Sender;
    bh=qW4e/7dPV6XTfEUvEgM1Wfajsej/rnSz/mPgP3KcMrE=;
    b=lVT7mQW3q2DFk4/dVm9xm4xZwRdViU1P9BL7bDDPJuegWHy6Up9mOureYiK/I2SUil
    D9EkYtSNxn62rhsaY3Bg==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlLnY4jECd2hdUURIbZgL8PX2QiTuZ3cdB8X/nqm2aEmETWunvpscJE6zIsYJVSN/a"
Received: from nimes.localnet
    by smtp.strato.de (RZmta 51.2.21 AUTH)
    with ESMTPSA id Nfb42e10NDojMsE
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 23 Jan 2025 14:50:45 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: distributions@lists.linux.dev,
 =?utf-8?B?TWljaGHFgiBHw7Nybnk=?= <mgorny@gentoo.org>
Subject:
 Re: Standardizing NO_NETWORK and USE_SYSTEM_DEPS environment variables
Date: Thu, 23 Jan 2025 14:50:45 +0100
Message-ID: <9658083.GK2ZErXSoo@nimes>
Organization: GNU
In-Reply-To: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
References: <b0726076ea438d59d8b7b5d0f44a4ed6ca11d418.camel@gentoo.org>
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Micha=C5=82 G=C3=B3rny wrote:
> 2) USE_SYSTEM_DEPS -- if it's set to a non-empty value, it requests that
> the build system does not use any vendored dependency for which it
> supports using a system version instead, and that it links to shared
> libraries whenever possible.

This contradicts the GNU Coding Standards [1]. For GNU packages,
configuration of such things should be done through --with-* and --without-*
options. NOT through environment variables.

Proposing something that contradicts the GNU Coding Standards is a non-star=
ter.

Bruno

[1] https://www.gnu.org/prep/standards/html_node/Configuration.html



