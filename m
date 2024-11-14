Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B31714A5
	for <distributions@lists.linux.dev>; Thu, 14 Nov 2024 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731612163; cv=none; b=YGSG0cNaMhEMovClJC9lFlXvhM+EdK7+Lo1AVcCBs0Ar1GRAPFJ4lmOwHT0SuzLsrzGRJBWAmNcMEgGf0H7hJK6c4hra/BOkBmsdUew2zU3w5mEK3bM8TsxEniuBxF3+TIhON1KavIH2ugLDliV5ivjnVf/zWTZ4qWFrhee+aMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731612163; c=relaxed/simple;
	bh=IngQJRPl/S4FjgLinNoOudBmjdCVlijORFviny4c3uY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=MYVSMdmv1rKMoFTFSIV11BJxgFlP23FE2OKNWjRiNWkMjL4mlBHwXuFGOwSaxqLWMrVmN9FdJMrVBK4UTY1uAcg2eAiV1ZuLirv1aieMKoyElDaGuaDoYxytQGCUGAGIMeZ7JxL7JkpJtvZwmvCOV6PKTpodZIu5cEiFQxFusyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=xFVW63G1; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=Y+aHeAN+; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="xFVW63G1";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="Y+aHeAN+"
Message-ID: <04612379-9624-4284-a0cf-6242ceb2d20a@archlinux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1731611776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=IngQJRPl/S4FjgLinNoOudBmjdCVlijORFviny4c3uY=;
	b=xFVW63G180hSW99C0RwdK6cJhUQSuXSxR2G6FkQeEcbXtkqNpZdntywi446eTZ24RYPH1e
	4tW3U0QOiqjF6zg1o3vbU9lh1ciALqgBHgvpXNH9pa99/UbLGUe/afX7NgFL2oQAdr1mLu
	6ORE7hMGnN+J0znoL3UFZnCT/D1buC57m1KxyyfPQ9hJS2IIf8d12wsw9m4FqraxftrRe2
	ypHDV5Lyij8Xq/ssNNUq4q9EAuinPNbZV3fHVC8ksBGMymPugL7TOrB3gXzVRxp0VeB4EV
	XzvHgNJ80V/KGHz2LzGD8ZQMTQMvOxhU2f4zZP7jgracm59hH7EIclo4fD42iz70uA3TvE
	zmom+xVPNk+QySCdVjCHKKW/iCXrCiRLc6u3YwbSKt8AIXU1k15M0CpfCcTjkCWQAIGyab
	DL7U4VmitaVQ8FsjrqQ+/Glj6vby8IpPNanOCfMFIsFDMeBCb+dES3IRip8oI61A4+q3F8
	drooxEtd9NpDzMn7JHlZ+MtbMIo+eHHXKWbcOFT/LoZ9xK/sMfCm8YepTHMWkVsjz7GUi/
	oNon4+pQPDJl2VRpvf3co6TvRw6kVxpgL8nPSPXOVMZpjiaycvzyq2gv1ALDCdoiZnUWmc
	dnPjjpu3BSdpf5VQZ1w8LXXbwB7XqaIqG7bT9hvlRqotmq3rx4AkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1731611777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=IngQJRPl/S4FjgLinNoOudBmjdCVlijORFviny4c3uY=;
	b=Y+aHeAN+6hpzr5NiAG9aMKK8/wJE/YUCDfWR8vl7WKdqYuZCyrxL8Qiy43PbKlZllh/1JS
	4UJp7TBYoxMlPhCQ==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=antiz smtp.mailfrom=antiz@archlinux.org
Date: Thu, 14 Nov 2024 20:16:16 +0100
Precedence: bulk
X-Mailing-List: distributions@lists.linux.dev
List-Id: <distributions.lists.linux.dev>
List-Subscribe: <mailto:distributions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:distributions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
To: distributions@lists.linux.dev
Content-Language: en-US, fr
From: Robin Candau <antiz@archlinux.org>
Subject: Arch Linux RFC: Dealing with package sources and digital signatures
Autocrypt: addr=antiz@archlinux.org; keydata=
 xsFNBGPRXZEBEADGfMANmAN/uCUdnzSThtfHJB84a4kmEt5f68BzohASR6++zyl43tZhyjM1
 BVNaqL2gG0nzulpEaMkeJmcojFXnzv4d8+ess9qWUELr9P3W38HP75Lf/59+zADznoKKFSr4
 pyKBHe2YquAdokwvQkFukhxAUBeXvD/LEZzHJvCg22rVyc1RSXRAasFYe9PmQhegDFjA5XVN
 1qNYt+/R5YZtlP8kDiNIiwzUzQr6Wti61yvqE7suu5GxssjrXHwtRJAdrho8Ai4hdjfqhICC
 MrppMUZLyNNhytJrDdUW9nes9YLPGWfEmMzu7gEMvnuM6//RGjEvWSSi209cAmWwNRS6f2x+
 uCrNU0EtRgrJE3NhZPUpDKc3LNYNr+6PhwcgoTYIKY8trNjG9ML5uX/rndQPBkycIm1e7/Fr
 IVYXD6LoZHXUxVB1T82Qpcm3mNQIdQVRe14vV/jb2Huol2EnS4bsolsLDr29ouBPyUPVkekj
 nlXWqRyAAeTB6RcKbwDNAhV3TK3kiBaUPKMBEa8nfghvYvnKXSLxtowKfU+vqaxGgIgg3ZqB
 Q4QtUPGyqwVQGMFjoEYj+fSCS7pUYm9GAN/mUOvizxuVQ30HEuNdmQaJmQWGAnTzMmeseEsm
 aIIxjxKGrMC/SSt1Sla8y9AAHHSo/mRQpod8HSihh0HqrWATQwARAQABzSJSb2JpbiBDYW5k
 YXUgPGFudGl6QGFyY2hsaW51eC5vcmc+wsGUBBMBCAA+FiEEJipY7GxR9+o5Wy4t/cMEC5Ks
 p0gFAmPRXZECGwMFCQWjmoAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ/cMEC5Ksp0jf
 og/8DfIKFW8aFFaKb9p5S892K4s6coQiO3vTuleYULPOVKpIJPha1AtTp8Ujiu7Yx/10lLlz
 c2/ELzbZL+VCRvBwSkpfA6qIj4JhjOI/SAC5nzFzQt0Pqeyrr04rEpt+WonxiYA59eTKBNUd
 WNP4W3KXXdROXA1HKIbv+ewLWkh9jilSOGeQ80HaxewfZqRe1G0OoxFERvDfyMqtZBWhN3yy
 Gwby7dVds6mZsn9jf+8t4axZSzhTkol9pRj2gDXh5d89VBdpLb8283U8lMKDqbikIXL+HBW1
 Xb+tKb9rY2Y0FbuFCNbyVxhzf0YB5Iz92s9yluqXID5tFvBJn7wER8ZewX2Fq4laJLJU+x1l
 BFvM3yJhRnnNwF12hNQU1Hn5hfz1L2OtW8tv/bZyLFnuiZJIFZbMr0arLC1qGP8HZZM0/gmN
 mFmvd714wrcBw+VjUHOti9FXzfozDdrygTxh55U0Gdg5dc+pgLqk6QS5dhwUHzOL+pFKDYUO
 Ee5HTU5MxuNCGGJ8dDJtqZ0UGM70FU/lLS0nGRiRxsJ20zKOP9M3eg55H8XQzYQ//OC6v38j
 AF3fiEFtKN3wSE34UZCaDSFenuV39kipfKIIuujw09TzVXQTEY3bf9JLg4rNv7kZy+TKfCv8
 1onppRvMc7raUVEPGKV3lvgoTOHU/EMhDh6QllTOwU0EY9FdkQEQAKhfIMLvg8u3L9+KISdJ
 GUHFl9yUarF7579dtv8pZKo1raz/SN5MkiEv2Yg3QLwqwVoBbI/qsjUIkF5JVOtx9GnWHqWG
 LSXVl64O56bkp55UpcDvJG8WXtKawkpaDkukzcgoWyM/OcpUyoIeJHtQ1uewt2mRzp9DcarV
 Mo+8RJKw6yDa5gBCNNW8/OwjIef+HqMqZ089xaphiOyRtlpcuPGCjpLu/zMFEWIOAAS/DXdI
 PzewaoJM7AXc6ceSoEHkpHYIHQyytef5HH/vi7R8BXonI9FPilvXogQ2V5IBu9jb4k8rRHHD
 DJk2RcaB30LPjM9gIOAvQUEWNetzgYuWiU8QrIj+NiJhn0HW5StRRlzcplpP8TcLsTs1oeeT
 YF/JnfDveVPeP1w6YEjkY9VuAfzKEpk0RaQMCBdlHMibakNgLsVzzSB9RTRL+E2+5mUWXK3A
 OodRax3khRUyv+ThsEGQh42SzPQy0x89HKgrDysQEWZjq8VLLTwOFhvAgPa52ojYLtBXcIUu
 4QUeRt3afsNnS3Vix9QUZjzyICpSEcamFt4uC1CzYfroAAzTrKFClW00WJ4WfEV6YjAM4aWa
 Tlp+r1ju2H88o1adVRFqzccJCuP7OyHsha4Y1xKrouukqFV5iYgmhpQYfosZj5aXaNINFItM
 xxTKmiIf+xvqQosvABEBAAHCwXwEGAEIACYWIQQmKljsbFH36jlbLi39wwQLkqynSAUCY9Fd
 kQIbDAUJBaOagAAKCRD9wwQLkqynSDueD/9dmpmoZmRvVe+L+C8lVkUaWdJN8qCKpF2kV7DV
 mslwhRBSLD5BXslIaUjKPFut3Smw9T8j3h9lY89a8KLPQRZqnhRJdfSq0EZxkpx/rToYIxPA
 pK3UUDoERtqmFVhXxy1Aee9xaU8j/OP5Ko3LriJY9eRhxET+pRoTLwRkQnKvW2NzjzCGAdyg
 5fPLfm59D4NCC0uFCDwCFtpXHUgVOc9owf33P6YiZJBUEwIDOpXGt7UlKF+fwRoUhJpHCYJ/
 igr/ctjip9NwiLraQ5DJGhi7VV1JkakJKTKdjnEuaDeWZgl2SiUUlzFDGITM2/+HW2RUENBL
 Vs8NBnRfODYIk7KH02Wb67vbsC2XyHG2gK+7cC0C/bBajvvoFVPvrnbf792BM5V3A//OFvDU
 /eKZjC6DlTxfRA8lLW6BieIFlV5c+iVJJcT4x6cOeD2ticOGkt0lAcGhGASp9jGnWqGF9jdB
 2PluFxMbl0DDiLqy22SphzrKLSdBUWAjoWPyAzDx9zBoEvyOEfQrkGFSfhFUzvd26MhNFPOP
 Kjre3i6ZNRDNxKl0SsEz1PvPsI9opRllIm+2kYf5afiqZKYsly4ydNl3WQ02IR7ZGDfVXM8z
 58YtYYnZBkcGLLafH0584y8+mOJpcDR7wqX2IUu14qcvoRT1Cb9/6ZS5s4ZSrdhY1YEifw==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RR8qcBZzuyMnQJej9mexd644"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RR8qcBZzuyMnQJej9mexd644
Content-Type: multipart/mixed; boundary="------------TAeEcGgObdrJwnuQcEoiIa2Y";
 protected-headers="v1"
From: Robin Candau <antiz@archlinux.org>
To: distributions@lists.linux.dev
Message-ID: <04612379-9624-4284-a0cf-6242ceb2d20a@archlinux.org>
Subject: Arch Linux RFC: Dealing with package sources and digital signatures

--------------TAeEcGgObdrJwnuQcEoiIa2Y
Content-Type: multipart/mixed; boundary="------------gM8rk2YFl6iDy8xcfwuKNhA4"

--------------gM8rk2YFl6iDy8xcfwuKNhA4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUsDQoNCm9uIEFyY2ggTGludXggd2UgYXJlIG5vdyBzdGFydGluZyB0
byBkaXNjdXNzIGFuIFJGQyBbMV0sIHRoYXQgYWltcyB0byANCmVzdGFibGlzaCBzb21lIHN0
YW5kYXJkcyByZWdhcmRpbmcgdGhlIHdheSB3ZSBkZWFsIHdpdGggb3VyIHBhY2thZ2UgDQpz
b3VyY2VzIGFuZCB0aGUgd2F5IHdlIGFwcHJvYWNoIGRpZ2l0YWwgc2lnbmF0dXJlcyBmb3Ig
dGhlbS4NCg0KV2hpbGUgdGhpcyBSRkMgcHJpbWFyaWx5IHNlcnZlcyBhcyBhIGRlZmluaXRp
b24gb2Ygb3VyIGV4cGVjdGF0aW9uIA0KdG93YXJkcyB1cHN0cmVhbXMgYW5kIG91ciBwYWNr
YWdlIG1haW50YWluZXJzLCB3ZSB0aGluayBpdCBjb3VsZCBiZSBhIA0KdmFsdWFibGUgaW50
cm9zcGVjdGlvbiBmb3Igb3RoZXIgZGlzdHJpYnV0aW9ucyByZWdhcmRpbmcgdGhlIHdheSB0
aGV5IA0KZGVhbCB3aXRoIHBhY2thZ2Ugc291cmNlcyBhbmQgZGlnaXRhbCBzaWduYXR1cmVz
IGZvciB0aGVpciBwYWNrYWdlcy4NCkdlbmVyYWxseSBzcGVha2luZywgd2UgYXJlIGludGVy
ZXN0ZWQgaW4gdGhvdWdodHMgYW5kIGlucHV0IGZyb20gb3RoZXIgDQpkaXN0cmlidXRpb25z
IC8gcGFja2FnZSBtYWludGFpbmVycywgdGhhdCBmYWNlIHNpbWlsYXIgY2hhbGxlbmdlcy4N
Cg0KVGhhbmtzIGZvciBjb25zaWRlcmluZyBnaXZpbmcgaXQgYSByZWFkLg0KSGF2ZSBhIG5p
Y2UgZGF5IQ0KDQpbMV0gaHR0cHM6Ly9naXRsYWIuYXJjaGxpbnV4Lm9yZy9hcmNobGludXgv
cmZjcy8tL21lcmdlX3JlcXVlc3RzLzQ2DQoNCi0tIA0KUmVnYXJkcywNClJvYmluIENhbmRh
dSAvIEFudGl6DQoNCg==
--------------gM8rk2YFl6iDy8xcfwuKNhA4
Content-Type: application/pgp-keys; name="OpenPGP_0xFDC3040B92ACA748.asc"
Content-Disposition: attachment; filename="OpenPGP_0xFDC3040B92ACA748.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
s4ZSrdhY1YEifw=3D=3D
=3Di8fF
-----END PGP PUBLIC KEY BLOCK-----

--------------gM8rk2YFl6iDy8xcfwuKNhA4--

--------------TAeEcGgObdrJwnuQcEoiIa2Y--

--------------RR8qcBZzuyMnQJej9mexd644
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJipY7GxR9+o5Wy4t/cMEC5Ksp0gFAmc2TIAFAwAAAAAACgkQ/cMEC5Ksp0h+
ig//cHXL8yXMK0J4JtqpFQmeo2S87DcQUC7zRMk4kw7iuxBW2qdvH1iYlXHVszR4Bq0mJZw7DpyU
8p5Iw+hL5bb/Z8eIaCNMK2tfPPQH7ap1q2ByCYm2hqkl3vDrXH85gvfwgmWDKE2un5xKNyz2nt75
4pg12kd14w4u2puq1WGiHMIUcstsuWLSR39+Kb1mQhpBDuQNDxrMRY7H43GB75nb2iwEZvo5YG8Q
uuGQbO0JDSP+4dhNQs2S/aJfmX/9T+7hOukReKPuEbriSLV9TszxTXzgMuXODsIXzcu+RqMkBcoW
O1KaPlhLlxLSwyDJ+9kli/nHEsLx9cdHUK2Xmd2InCZlG3EsbfnVxNaKoSNkay/bsQh8KzOe6lIR
kETJnTdc0k8cmqU3y93Hb475h/yFnRcPxbeIWEUXr7mPLwcVf/F6Sd3nEpmzL+2cmedqThHBV0s4
LyttR1AKjSOP5l02KVc3ThB80HAo6BNEZo/WYznC9jM3YQS42OsqiuGVyqNsZFeAXwldcz7bmPQ/
PIFe7SjZHKwgvgl/9emEdwfdWDmY1lzTJ579/oJpbxH65YeQSv2OdPTlRON9mchvup30kuAXD1S5
weJi2WsvaG+UYSDZgBM4ZUZWhMJs1po9AbdQ2V3sF/NGM9w19+/sEmkFO0aGjM5+q2/Mv6TxyYLt
TZk=
=IqJY
-----END PGP SIGNATURE-----

--------------RR8qcBZzuyMnQJej9mexd644--
