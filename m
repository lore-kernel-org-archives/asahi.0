Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144B241DEC9
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431758; cv=pass; b=GDdvUvREwpCQnToYwTN95fGf34cSRVSsJ82gIii56AYQQrhIs1r/qnny5dVZVrszWkOU7PCYR1yJVo4GM5mGQMnUE9LfogCXo9zYgIy/xjvTGwLYJpRt8BfmEkD0OvM/E+bofmq2NdHzVwOjkkkrYu/+mu6/2cTfCXf9MbHRGJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431758; c=relaxed/simple;
	bh=E1zAPP9belnBMx2I7CyLtNbspD4kzIfqj0U5PW0gNQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gglAtPG9mL+X+0CXeP92NUlUZFg6JvXWfdNLt2vWoDd4kxeszANslTQKLi5rdTXAA9ztG6vDl8BgaKF+ee70sF8203MruSW3mfeRP1SH1EQYa3mMZYC6BqWZdNlAubEZiP91bRI8kfsHN4wzZt7q60/jhagIVVtKV40w4r2L9tA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sK+wk/Rt; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sK+wk/Rt"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66780d9d901so1729858d50.0
        for <asahi@lists.linux.dev>; Tue, 07 Jul 2026 06:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783431756; cv=none;
        d=google.com; s=arc-20260327;
        b=slFkiXemeLpYXrRTolgeBCDgUDKCJWSO5jMpOf+UyQv08rRP4V/2yrDSbLhYM1qf/W
         xlm4ki+FuTjRpTl5zp/x0EN38FfZiguuZuQgqqksnjh5yPG9kieQqRjvAFub0dWfrCnw
         w+HxhHuu2Vl+rmplICxvwffiFl0mbyj+wObe9T2ua3AzjUmSto/p8Fbx4G4id9BzlMgs
         DYeRxeUGFrbumqKf68x3dQmcMNTjRq29790ptk94+wRj/+VKFXjDN2rBxrJDGj1aHpfg
         jF5FhLNb2ceFmvoxG3KYPIB0WEsrIAVxQYPilaq+vYWDhWnLQDcPxJmpOd+qAWFsJnzw
         QjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1TwL3+aqF7dc4/lpQ2JLA2uoetuIwHkPHzHxzge8914=;
        fh=Xq11gT/4exsOCyeP+xwtAZ66PLyPOUIRnXKxmnGTI3w=;
        b=QYCJiamJmwN2RQCxRXP9ysgkBzs02PM4hAe/hA9USBDtml93HdqBjUQ7i+eIOK5VIl
         rtzNbTKFAM5n+A0i++iAjE/RxywI3LDsyisTPciPnX1XxKwCfTrzQJEH/3FPYH82VwWh
         sboYoA0TVhJAc9kZanAgqvLoiJT5kcadAv6wylgDsOHT20rsagtJ1KTX4wtmQwDfh7lf
         Vlzkiv+ut/lkYN3r3E8qGFeGVu6NRFYKV9CoM9NWPCjpHfUvNaubI/FuaqzsnA6sTzUz
         KB9QvxX5DLUngEOjjdUfgzaE9w2twqeHyQCw9sm2XBHntWUBlccBoEB2vxewa51hCruK
         xlUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783431756; x=1784036556; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TwL3+aqF7dc4/lpQ2JLA2uoetuIwHkPHzHxzge8914=;
        b=sK+wk/RtjNiew4pAMd3CCsIMI+SupolyavmcMvY9so4B9j75Ed9iaCf6p6F1x2zolt
         8zrejjT6Ikvv/kO84bgUUewprApbk/M6oVctqD7xMOmD/TG97FQnK5zwwUw82nfKm+1o
         Vv9ZQQgl7vzkR/T3UyuHL//4IYqIcm9CXUUV3t4urtb1Xbty52l8EW9WZFOrSOSkfCrR
         Q/s1okBVqoW71f6veYga3w9ao3qkhslECd2ocZipqSIJdhJDilh/Us+yxA2TwF9R4DnY
         1unX+bLkQZve059MlY3yXbfZ45lv3ZQszDZj9daxJ+tt9EoCR+bHdOdBnNTtp8W7VVPU
         vkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431756; x=1784036556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1TwL3+aqF7dc4/lpQ2JLA2uoetuIwHkPHzHxzge8914=;
        b=GoABo1/hdO7nCn6pBdLcphliq3EBoIu+kqpr5JXxhFiiljx1x7KMDsFIIPR3zIvuLp
         U5/tnTlPuxlP4axjY4jaFIVzQUKs8vC22MXJcCPooFFZdJkJtQyolbywQ7fLeJR4iTe2
         hNYf/2Ftp17fwl9rpJwlyUcFSzB+WfDhFp51mWY8A8wfqrdva+Pk34CDhTd678ooRZVp
         hL1w3SDhE6c9HC55eAlPoCi/I4mwQQVz6c2mRgtrciEXkH4258fkOaq85dF3CD9P/xUd
         FKe4axfg8Q4ccpmO6T3Xw4vyIgr6KkGWErmtxS8XQZFmWch9sp25z8/DlbOgMmkYkh48
         rncA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0MORoUzrBRObNtlqaWYgBFlTj+RjdpDTW2P3XPxo8lYqagJ693vXxSmqfD50wLTd0tkcHqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcpFkMaOqlKzdITp2am6dxSZFduNmfCigxZ1RLM+suFTYZV737
	/y8VMewV13nZ7WHe28ZZ+/oMOj7MR5zirSo1UW6BGA6eNL0lirO/5pbOLDNMT4DBnXxD6AJ3tuM
	62B2UJWDTrQSbKQVBQMsQal1He0dA168=
X-Gm-Gg: AfdE7cnGmHcuzcIjMNRVuWe+/R1POxhA0Xw8AEcI1YGWVD9NQPmrGzROGKF0L+hAJBj
	yWnJ6lV19Odugm0Y5xIWbaJXfxobM/l5Sr/ZM32aQpxPku9LXeIoDvNCgMiPjzcB76W/+gsU6Hd
	QXa4T3qVDD3TY7kTkMWzTBdpI7KfFLqyE+W9eSGEeECj0yU5o/gJK+a5Yi2Tqv6wRd6vbFCYkhB
	SORWFgxi8K52ofXzgQZdP25cxfE3K/jZeOsnnLi8y+Kxd1RcNrjwguUWldOsWmNEA0qOggN35Uq
	8BxCHj+8hK9Ac7o/2QYoWv18zHOFVo81+I6qSxrYlPbAPhCzkZsH9u2SgCb5VGOOu9h+rRs3
X-Received: by 2002:a05:690e:488c:20b0:664:d231:2f73 with SMTP id
 956f58d0204a3-6677fbd4331mr2922458d50.50.1783431755730; Tue, 07 Jul 2026
 06:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-5-506d936a1707@gmail.com> <e23e4581-7eee-4f4e-aa82-6b6bb6177678@cyberchaos.dev>
In-Reply-To: <e23e4581-7eee-4f4e-aa82-6b6bb6177678@cyberchaos.dev>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Tue, 7 Jul 2026 23:42:24 +1000
X-Gm-Features: AVVi8Cepx_g_efgo_16NLDYw5eSOtcfEnI_otyB3OoPCUn9_yzRFa4EgaystrR0
Message-ID: <CANpmGNtnZo20nPyM4qB7Jcty=bRFsxsDWnAOk9Md6Y+Rd9n7ZA@mail.gmail.com>
Subject: Re: [PATCH 05/10] mailbox: apple: Add DockChannel FIFO controller
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 6:14=E2=80=AFAM Yureka Lilian <yureka@cyberchaos.dev=
> wrote:
[...]
> > +             while (block) {
> > +                     writeb_relaxed(*p++, dc->data_base + DATA_TX8);
>
> This must be writel_relaxed, as writeb_relaxed in this mmio region will
> cause an SError. This is why we have separate addresses putting 8-bits
> and 32-bits into the FIFO I guess.
Ah, thanks for the pickup. Sorry for the silly typo from me, must have miss=
ed
it because all the HID writes are 4-byte aligned. Will correct in v2
which I should
be able to send out by the weekend unless I get busy.

Thanks again,
Michael
