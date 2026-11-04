Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793809770;
	b=DpxEyAUgWY6iAAYMwEnJDWdSdBgmTR2Rh3cxcBgibdw2F7MhJ9N24nq9bguFQBvVao9I
	 xqAH4wA0sKGNkWTVgT+wEqWK1vSfX6wqwc7wjoHDEo0VwtUDg3FZoTxPcNOAdktI5W1VR
	 YmVGXWD5NZsA/NqUNyxoak+4SAQtyIdwICjZP4TXdKpOZsUdVvl67mZ8gg1UarsSPraZy
	 4A9rPvdkgQPkRvl0+vfxRr/5Im34cAi7aSfsQjYLoZOT3HIbyWfkpU2Cdf3SRDPhPYM/F
	 Qxf77/nm87fss4RUFoBL6BgHtjZiTUH+GmiAssHWkKOYCkZp50W6Xd/d2fudebV/44g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
	b=1jVv3629404Q9LMKsDFDJbE3bqnoFkq8D1nkrP31+NYZGvRGJGv7sDx2mKzxuxJ5HImV
	 0jTrguzUSSOnLIIWcznCNgYVQthfJmW0LBPGRSl09xMMhnuCemRMlf1ZkN43ruymtHX7X
	 Kmu2vCn7jVKn/o5kZgShD4Fs8F/jttj423q8kbPo086p/pzhMM+Gmf0fff+tcdh6Vubec
	 qThbbUd21LHURA+38X580GWbpFBoV26agV8NbLzEGSCVrvFC0Dvv5dqZAddhYVHRcwchd
	 DokLD0Kdvd+vOtmwvn4AIuJrUZHgdHzKxi0mVSLkvfxrdIVr+DgNrK1AeWi88Ai2uPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1Nusspn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BDB606A33E
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 16:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BDB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L1Nusspn
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67bef25eb92so927677d50.0
        for <asahi@lists.linux.dev>; Wed, 04 Nov 2026 08:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793809764; cv=none;
        d=google.com; s=arc-20260327;
        b=i/aFXGGNTEaaPTaAz88ctBTxLAKg4rQlYNaHpljZ8oWyJ547N7qj+dCKI3wjEVHghl
         HVdCrLRa6LQOL5Q5VIbaKHEPOjK6aXjk6tmsbk/LxElbrX9pmyIKJLTy+JH6aWOWV8mD
         Hooer2lt2I1LAOtkhTsNb5Y/41guO/6kenYz95mgDYRVhuF7Gygrse5eQ9AtRSqDWiAr
         wvP72dxKi3/ryY9oM/8ZyAetaGot1TQaftB43UxPyjW9EqgQw4lG0fn9g8iRD+bhaVNo
         G+YDJJ3dK+1lzWvq+VNORN/kRMZ3J3E61/8d6mZYNT6CU8z1KvXNLXKq5k9XRaHzznHy
         xAbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
        fh=EeMvpAm6GZfVGWl952Tr84g/SnUOmAQi8UyoYI+G6Ig=;
        b=jCnxbLNug49H6/L3O2a5zFN8aB5dzCZkfz5S4EH3ImQSxHTpFH2V9HndWOafmgYZqk
         zP2E1xWHeB//B2JoCSM7+OrKYPEaxW8/yhz8rroRRnPCbVIDlPyCcfAmTU+tLBAzduE3
         Dcx0jK9Ku2PYrQcjyNlO6zvzDxrieDnjFLKmdwrOAUpE+Cpv4mEVwNMTvXaH7a0psr/W
         T/TRRs1UdRjzYeul1GyNLFGWyp9+uwGqX3EpVk63DqvOrI4Mu4D4O3gvMgCltYaSXVQf
         4oQ8HEHByeRyO8qDm4uAc2haFR5j94XVVSYw2QC9vQ8Dj8aPb/agvtMKoX5wGaJdfADJ
         4vxA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793809764; x=1794414564; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
        b=L1Nusspne5TIViO1Zib0frmT0DRt/iq1Ao7b58CV64Esv7mAuJQK97lG99hXQQO7VQ
         p/70bkb+aIgssqi5gp1kkownwLddUsHN0NxJeH5HN8XlArqajZM7AlGI4n5GAUi/5mSH
         cTLrn6SgZSRVvP137gRcNP5Yng222aSvN/PJ3wuxG8vo5qGtdBOsXub5feY0HJ4s6Whh
         8yJ3fyT5t3X3mm/5sPeFhktJKUhDdU5CWSAISaK9pqhZNfI+RAxAj+qanBKVjhYHsGEO
         RYk9HvSxuSu7o1lj8OR34QT+Eb2MdbrCrN6VwOcJ2qRY5Ed3cYKCU+9dR9NLeHMrkSXt
         U83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809764; x=1794414564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
        b=kVlYKDNyelxZ4U/gD+LEovG2lKLdhnKa2gA0oBMpXidHWKRDMu5EqO4lXqpKJEZJvW
         VhSJ5mIhTgZAtfkmoVsGX/pVGq4GKxn+DZcqOVVlY4rnJ0fZYRsB2WjZi2ZtoyUV7hdL
         2/J+X/mDvS9omhLJRJKeROcWdc7ym44N1jpv5JKC+8h9wySy83K/ieSlImfulVsiSFXd
         aVpD4qf6ZdCjBvDC7Ej7AXJbAkk7PfzU7+6MiR9h/m/OmbdHkmddImXgDNOdfHYE6n7T
         G+ayXYfoTG4I1sVr9LCdqfMmWxfYXTq8o78RX/LAmXBrC/+VZmWUFe7u+uAamyJJ3Eyl
         TzVw==
X-Forwarded-Encrypted: i=1; AKwUvByIxrfegqu2gh0ygGbAUQz1UJAM0ucHnx4iV3keplSHMq//fbFcG24JhnN5euc4J/1XnLeICA==@lists.linux.dev
X-Gm-Message-State: APuU4Z96H83lPpin6hUcICWL9zcrGy3kBX6OpryUMYtxtfSWLwQR9AQ7
	jFB6+tYV7mXfWYL5yJXKKxMjAxnmtbPlMVRPRDn7yG0GKR8a1i+O6U76nQE17DdrZ3ng9It73h5
	NMyf2j67zdy6gQrLI8G9+6gkpOUrvuLU=
X-Gm-Gg: AYBFou0KiL9LGuLmjRCOerMu99IhHjlUkpobLC0TfrWsNy66S6DXyOAXSt+pluiWrdc
	WfosVi5l5XaRLvoI7JSJDz/+YXIO6s3bqSYtcabW4UcWefdifOgjBv58w0N9aoreD3PkZsQS0qA
	2sMuIWu4lUzCG7DNOUpVEaPaSkH3NChfRvYUcjGuN37ENH0+LmHIdlSDAR3apztve81Z8Au91mk
	PJRv+U0yhq9/poqtSrCVk+pzlLdLs4val379TJQ6glZ0JywlC+rgEGmL0pPYNSo1eXbkwxPlC99
	YQkXBN+bmiHWyyWck4pbU6HczkJ5HdRbQkneC5XeIKtnTZGNMxKO3jIu/fgbpv784ykVRWSf+9m
	5UMgtvQZxOeC6yWoifd07iOvzcFb1AtAKwj5tHhJIr3yGr+neb3I0ig/gaLqcn498/OUZc1wN3Q
	Gh+OWPLMMl6kCry6FNaq8KRPIinuFL4sSx40BoRRmRX0L34VxstlGGiP9h/w==
X-Received: by 2002:a05:690e:80b:10b0:67c:18:cc8d with SMTP id
 956f58d0204a3-67c030026e0mr23243d50.0.1793809764215; Wed, 04 Nov 2026
 08:29:24 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104151601.70493-1-dev@deq.rocks> <20261104151601.70493-3-dev@deq.rocks>
 <CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com> <20261104164647.5e9351cb@kait2en-mbp15-1>
In-Reply-To: <20261104164647.5e9351cb@kait2en-mbp15-1>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 4 Nov 2026 11:29:11 -0500
X-Gm-Features: AclHuK8doVEFo6j2Fi68c-P_EfTM3lCyF-M5HVrIdSqvITfMTgBypxfl_seEBVY
Message-ID: <CABBYNZLwMW68WYBVp=-R=4Mji+-Q5AEtrcu5F_7rRYju8d-XNA@mail.gmail.com>
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE advertising
 report types
To: =?UTF-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net, neal@gompa.dev, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	66ton99@gmail.com, josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev, 
	Yossef Osman <Yossef.Osman@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Wed, Nov 4, 2026 at 10:46=E2=80=AFAM Andr=C3=A9 Eikmeyer <dev@deq.rocks>=
 wrote:
>
> On Wed, 4 Nov 2026 10:24:47 -0500
> Luiz Augusto von Dentz <luiz.dentz@gmail.com> wrote:
>
> > I don't think I agree with this being cleaner then doing at
> > hci_event.though; not only is it more code but it also walks the
> > packet which is inefficient and may have security implications as
> > well.
>
> You are right, the driver should not parse the event a second time.
>
> What I would like to keep is limiting the mask to the controllers that
> set these bits, as hci_bcm4377 already does with
> HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY:
>
> - add HCI_QUIRK_FIXUP_LE_ADV_REPORT_TYPE
> - set it in hci_bcm on Apple machines and in hci_bcm4377
> - test the quirk in hci_le_adv_report_evt() instead of the
>   manufacturer, keeping the mask from 88397423671f
>
> That drops patch 2 and replaces the revert in patch 3. Would that work
> for you? Then I would send a v2 along these lines, with patch 1 and 4
> unchanged.

Yes that would work. That said, I don't think it is worth adding a
quirk for this. Masking the reserved bits shouldn't cause any side
effects afaik, well except if those bits are later adopted by
Bluetooth SIG. Then these controllers would become
non-compliant=E2=80=94though they already are, as the bits are reserved and
not in use. In that case we would probably require a quirk to avoid a
conflict. So, is that what you are trying to fix?


--=20
Luiz Augusto von Dentz
