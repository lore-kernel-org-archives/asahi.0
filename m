Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352379;
	b=mt/vAkKLUSRKgKgy3LqC4pqzYZyzXnmWI0CjrAl9GEgnX+lHRSOz9Qdp7gtDB46BFJZz
	 qQ8JDAozKx3LHReKe+qW9lEjkukVaTPngcLLqd5El3TCLfJR+MO5WrqcgSLXqsjCP8rEl
	 HM5hT2ayb0f8KU930wohpgI3EnJ7YPfwR4MO6fY+MVNUsb7xJY73kyQqrR8o6EaPtI5Cf
	 AtnL3T5uEQj8LA9kAaOIEz5nCVDuJHBCcZAOYknW5Yefp5f7Ge2dDm3gfRpCNG1XLVA87
	 XuxOqjubZg0tAo08SG1i9R6AsfrvUYGO+ZFD1GrDkBYRi0SNqwUZt2vCHjzgNJ+NB/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
	b=MNje7tnydk46acawnGawExlOr345hia6RjHb8IN0VnBNO6wbXUacJRUUM2NhUXbprAdb
	 7N156mT9StVvxaUiVkObA3r4NsPi6eoI3/jaX6M4Qr/bagKzfAS/y+SXowVbwrMKuBASd
	 9oOaqaZoNYBwMAPqlQRe6qWckLGdemwop1B7F1H/sUz2K7Fh2vLJdbAZPdziFU2KTGDLn
	 rKapoxvh5edfOCjb75cyRpSsGUJ8hwoS340biZIEPVc/W+7R5YZf0QHPj+568G/mrlYhx
	 xehjOSWQPw+gRjK+cu9gz17SnRR+AVm5lqFZqvgVvnkTPN0go6McoFSFCWAo3M8Jglw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iqDRS10z;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8A9606A325
	for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 23:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB8A9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iqDRS10z
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so3023630a12.0
        for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 15:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794352377; x=1794957177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
        b=iqDRS10z6xZEvN64EkFDLw3fWbHaNF+HrB46rz5T33gWpJlMBTnZEoR3AWzhGM2xt6
         OBK0Ls1dBzYJHAye/kYvPR8YNaJ3G84QUhJvaPwZGdw1OzZWqXWNwtxPS6Q9zycvDD1r
         j908/+jHK9D1aw066HpVh9aafX+Sss75WpIIAJAYP0Y6u3prK/IiqbM9NRgEuzTg6xyJ
         mMdPTUbSo8UsRuklYQmEZQWL83vTnqhoZ/LYYfFABxjvwo3QKCeGspWqX8I1iNtriGrF
         UDIpPw8/DfrTPpQRNWm2NnlZAh7RdJH8UNyec6bskdIQ1kM571qgqEM4JGrdAFt1Xvmu
         WtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352377; x=1794957177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
        b=d1++g2pIdm7EVBJXkTDDla3s5r0N31PHBsYO5d8ue0j+qFwQ7fXTtlR/6v4goUVL2k
         0V0VVEX7/AGWcr2cyg84uQnZLXJm07/zENsjFqsIZSuR2CTxo7j6/6m4Gk8ZasiEXsgJ
         FtgwDrxrqJ7GfaRW7b1wzb0T7mRUXMDgSD6IjCgKkvOkLhR6P/yX6xHluf8VCuAcLBJo
         fzqb7nk7CuRuTa+RataWGk5Hvem4z9SmQ6p2Mjsj5tjYpZj3oK4mEDQV2/TfBJtcTBGW
         3D0vOlJ5+rtsmzEeMt/cfoYQh/RX42kPJipO6xgo7HwwELAMTXShpptWFMUwW5Zk6SM2
         2ozw==
X-Forwarded-Encrypted: i=1; AL+hErGaZN1TDS4fiKgDquaDjqHAmX4Blnl/aqh9F2WyW4CsvoK6LhXcRqHyucaML5/nbnPRidyRvQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+q/icUhQpFbd9cyldTCCEM9yj1MSgcS/V82Urcxpx7D+tMJf64
	zPBjuGINrEkSlyu2wnVYpLXMuEfGAGf/TeYX8N5923LiNA24x21UYM8A
X-Gm-Gg: AYBFou1wm3lf2v8GNlnxirvAH39xmmCOkyBpsRhaF14ECKY1TMqDAXgxGB/S/kyxS6v
	I+53v9xarXiW+SZUfLSiROxkVwmcv9oWlzLL3HP53xU/Fgzu2G8uCtXL+QjlItJoGuBk0+Hl78j
	O2Ff15694BopBX5AihnOasf7uC7jJOoitInDWxW+UYRTqmuU4roBjO1VCXMjYq1KxGFGSO1Wzwz
	a2pFI0/HZWIQw0NtRv9QY6m6MEQYUWVMb1RSGISbn/zWWWPUio2MZ0lQaMuoN5xIlBQPUy7EWPo
	3QNnqaWMQhF7iFPGkk9F6JwJLB1BIuC1kL/r6+ndqzoR/iohbKtN8tPiSd6PmoKTzfDSsLiTjO8
	Ova3Rvs5LaMyf4yt2b2CBm8pafpWGU8llR1i30Xdzi5GsX3DAFXbCrRupZ+JCjUUcO0wtN85cVn
	u+iQGiuCFBRM7gbfoquS/rjlF4fuF8s8zSjKumXhRQTyJ/eCcE80RSpv976my1fkHQgNVT6AKYf
	lZ39tVzjyxVId8BWp61Do1x/yZL2HkKMj44HZkWxCv+y5sQMs6LPw62xECdHxBWKvcBSSV9UWPT
	B9lFebzTGMcNJh7rMSbZ/R5Q5LcJCEQv0aZrp4VHuozHJYGIHlXyy+Y=
X-Received: by 2002:a05:6402:4506:b0:6b5:7886:c450 with SMTP id 4fb4d7f45d1cf-6b77781b377mr528054a12.40.1794352376981;
        Tue, 10 Nov 2026 15:12:56 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790353asm1750018a12.31.2026.11.10.15.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:12:56 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: dev@deq.rocks
Cc: arend.vanspriel@broadcom.com,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	marcan@marcan.st,
	michael.reeves077@gmail.com,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH 4/4] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
Date: Wed, 11 Nov 2026 00:12:47 +0100
Message-ID: <20261110231248.206892-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107154810.89780-5-dev@deq.rocks>
References: <20261107154810.89780-5-dev@deq.rocks>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Nov 07, 2026 at 15:48 UTC, Andre Eikmeyer wrote:
> The BCM4377 firmware returns the tx status of queued packets only when
> it gets the flowring delete request.

The same happens on a BCM43684 (firmware 17.10.188.75, an access point
with about 15 clients on two radios; this chip also needs patches for
its BCA firmware that I haven't posted yet). In 10.5 hours the wait
timed out 23 times. 2835 frames were still out when their flowring was
deleted, and every one of them was completed later, at most 81 s after
it was posted. No pktid was lost, so the 100 ms wait did not help here
either.

What I can't tell from these numbers is whether a tx status can still
come after the delete response. If it can, it lands on a new ring that
got the same flowid in the meantime and decrements its outstanding_tx,
which also drives brcmf_msgbuf_schedule_txdata(). Do you know how the
firmware orders them? In my tree each tx pktid keeps the generation of
its flowring for that case; I can send it on top of your patch if it
turns out to be needed.

Kordian
