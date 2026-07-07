Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1747541DEE4
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431458; cv=pass; b=rRXDJXEh8tLeKLovvGCpIxHVz+OUOfXPXidSdjciLZs0km/bR/vCETbJ4f1alYmIaswtlIkqpqs7jW86h073+/gBV9AHCQyowqEquULNtNrcWzghQhhVwiMeFeFVUPBBQ9eYyMiPOyLp4J62+1qKqPO07HhEKkzjHHLtZGEc414=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431458; c=relaxed/simple;
	bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIAW867UF/nR2FcqhIpN0YFjpL9ZaSqDvVUNS8E/O3xliRCAfI6i1nlfXaw6HL0NHTdcUSyEXaAlIpyu+fsD+x1S3xBdDKasamccDQJqyGZll0gYHRjEMAW+SREcZz4D/hT3mjhYPiLz7YAeotZxW5QhzO3EsXlhlBBPzLlwovo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nt+q14YF; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt+q14YF"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-664b05d408bso3435513d50.1
        for <asahi@lists.linux.dev>; Tue, 07 Jul 2026 06:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783431456; cv=none;
        d=google.com; s=arc-20260327;
        b=Xom3+4Q7QpcfNitZiF4cOZHg3olRE4LXgW272wVzp9X1Ytpuaxs7qD1CAHUPuN5myu
         fVpbvgd3uw/Fw2tLMZbbFqFkewNGGpiXrnDQyvweRL5fOU+FySCZJdtXfv1AZlgIS8x1
         qVwFMJtBoZl4N1oHkXL++R/IbZqUQbPgnw59dSFyNsvEa14p9jHthnIBArFgB8bUB44S
         ojrV2onxT3CQ9juv20YH1zolSZJSg14POPtS45hhkBqIiPMLXOP+3v+ePcGwYBmEa/5y
         pqCvFoT55JU3/x0qlAi3MkI8k0JUHbK7mClCcbe29ZLJnUyKbHu0MkRiM8ZDrZyCoOsu
         AxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
        fh=/EWab+UOIus1k0FCPObozHprryWRfWlqq30mlNz/LzA=;
        b=Yy7RKbZ8tuukw8+t/W5Xi1PkywEf05wftMj+++JA6l4id14Hpwbh1+Q/0R7ngi7MRC
         YzrAnny2rmRRwH4IzKP+bkYj5cLpux1a13qHTWnkyGeB1PnRxOV+nKnjYW+EjYL03rpx
         9W7raLmzkUhssR8SA47JOHamyi16Fb1qZQF5hAwkq+7KU7DFAYrV7ujvJQgaGq0JCW1M
         IJmkSOWnACTaLDdBM8pBc3yideE52xRfuoJ8DvuEUXphz6MJYSUh+Go/U3IE+o7k9AzD
         ixzrJUUaC6X5qxJHtXxqewJbmm4i8hq+e+iQiDF5UmTSMoAM+S0ynkM+hg2tuPjuLuyg
         w9sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783431456; x=1784036256; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
        b=Nt+q14YFMuMIZ19UOYtl7cIsg0xf+WYgJazPnHaPZXCo0x3OqqXIqszDXRKXizhDfY
         rDQDaSlcMybGQQhdwQDlmaPv+K/el1/Y5gybtssYE88XfwDw4G+mX1H71tP67pnaHuet
         tht+pAd8cl4D46M82seYTll9SGdFpFizuAvubfNzfvjFZPLLLoDqp5rnEcaG2ATyBFSZ
         OnuUOyyLdjVOcjKr223su3PgOIzPAnLuGhFLs7oDVOPsuv8uL5M6ZtCkWm+MJv3zY3Di
         pw4RgmZyHQUOOhmTxwRjAIdx/15S6GYFKIpZwAerXsD83VfRrAZ3CauEdkeQDdVLtMAe
         o6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431456; x=1784036256;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YxxW/DgyJ8n8X4s2Jk8Sgjq3BzhWt1t3dn+FQ+NVOBM=;
        b=pPAzkjiYEOupB4t+GjZ+PJLm1B0YThx6RHnsIQc3knvKpq8GU78KW4tjUGrdQxCF7Q
         S6AqdRpp2rhzGqZcdyy4wfU7LIeRJbVXOs6BRniwpVkU/iKk4zAtJ26mkr0OKqutVWiO
         ltzOkY+UPop+oWbTTqEpRI1TePgA/O0jk6qemz7pun3BJmHO3cVfi8bonuVIiXPCvNVp
         Pkf5qdTwFk5sOXe+q1ItTNxd0FQmzisOextVcxG/nK735t0u9ty0+XZ57KfvSRWCMoHO
         Bn21hIvd136Br3zCW8DEnckfiiowrRLjBdJHQrQz3IeTDicYylr5KKbpzUb66T0KboCc
         K0Cw==
X-Forwarded-Encrypted: i=1; AHgh+Rpp/3NoP3WY8WB3JTEP0YrjqTab5WatvNW4Sw5kgOJj+7oNnOBPU/COEopslh7/YSUJeutAbw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq57tPAUVYPtrzo6f6ieU7dPOTNOwBy0CcVXgoYgbRvAge0AzN
	6IYyvxhuH5wPw9flCNfhK105IQT34qjYDkw2W6KhLHg8dlinJqPcFp//PiR6OPPgsL8kpY3sAkp
	DxPagXbwycNPog53pkWmJdQ52caKWbn8=
X-Gm-Gg: AfdE7cl2Ho0OcgyT8iAWBL3bPyt4U1OynGOFZ8chSH/0bwGkHomzXPIaEBsdbBSPxPd
	X29lWj4YD7p1neZB2d9f09ti7WcyLOWTbBVxEzKQ3Md+X9UboRnH6uGcHSk35LEOOMu/mrKl3oQ
	ZTCq/19Dh63A31qP4DR9RE8UKJJP9FyUbrngRklW+cS8BEgCWVA4KZ3hP5saDIrgT8ku1w8GisX
	BEc+tRJX1JbLOs1dytV7efdGom2mRwRCuaK04E2HBQMA/2XyZk0CERdc86oJvljR5Apu2zs2xGJ
	b5cCi+Ly395DpaHP1QSJZEkzSlPSwIym5x18Q8UxG/WobH8/miVMZZRjAYvGBw==
X-Received: by 2002:a05:690e:440f:b0:664:ae6a:ef6 with SMTP id
 956f58d0204a3-6677fe09239mr3207984d50.84.1783431455985; Tue, 07 Jul 2026
 06:37:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-8-506d936a1707@gmail.com> <a0cee001-7bca-438a-943b-da28528e7df7@gmail.com>
In-Reply-To: <a0cee001-7bca-438a-943b-da28528e7df7@gmail.com>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Tue, 7 Jul 2026 23:37:24 +1000
X-Gm-Features: AVVi8Cc2ZFlYzV97xsPmmL_XYaVoOo2UdWECw6a41ntBKVYGFTDcsFEpeCIlldE
Message-ID: <CANpmGNusmx8NQEu2x07rX-yd33XA9TJR_ZogFVXexAmw+7qq9A@mail.gmail.com>
Subject: Re: [PATCH 08/10] HID: apple: Add DockChannel HID transport driver
To: Julian Braha <julianbraha@gmail.com>
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

Hi Julian,

[...]
> APPLE_DOCKCHANNEL_HID has a duplicate dependency on HID,
> since you put the import for this file inside of 'if HID..endif',
> and then also gave it a 'depends on HID'.
>

Thank you for picking it up and letting me know!

I will correct it in v2, which I am planning on sending later this week, or
potentially on the weekend if I get busy.

Thanks again,
Michael
