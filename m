Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D546194C76
	for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732702931; cv=none; b=O9S2NbFboXYSknGkkjjPb/Rf+hXpl7cMLjldPvrNw4s+gjXrxdlbynJBMO3SldipRf0dS/csn7vhQguQXYuUa9jUqcsyFu4GJ20uoh57IXU4hYNrh+w8wPSbMY3X6kOcL4Xr02zt1vUhp8BUv2bVdj/1bPyCFsQuTMMo21umSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732702931; c=relaxed/simple;
	bh=dbxHNcjzVTHw711B1AE2wdX8JT/Jj/hcNUXzErfxU7E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=R0ZVvkIkyN3qxaAHH1hE01SxYoMmfJZB8juc/waxVkBXmnL1r4ZPccrGHfVWWNZFy3HgvNmE/S+JCmTlLNgOa5tVdo3N+PInrbyQfK7FoH2XgYYIncvxFrG+8sYp5Kgd38d7AjQtBAERSWRkeLiUjKoATeLXg1x9BarnKCIw2ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLwHXNwA; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLwHXNwA"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2129fd7b1a5so48291205ad.1
        for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 02:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732702929; x=1733307729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qz+EP+l7Qi3fy38Fu3GsKedJkFdI7GfNaCEpN7e8AWQ=;
        b=RLwHXNwAJmi9/77HO7GQCCHMOE7TSIM4K/ldnXMaDXbukdgV52/NRtMQ9Vf+alXjeh
         LKrive0ECjsSrtUX+olhPPzMcbSzZtTBBdWYPA0Z58LEEdMq2NDeqSzzLGOI0D2lsfi3
         Lex6li/llPiPxQ0mwdzLaYJKcoP14cm8AsmnFRZy3N+BL9VdPwt8k0dTyDc1YRHAUgwH
         361VQgByix6d55zm8AVsGTmoJkPafVZ12QetGrJX2l6iMQAFtesqQT4iod1pKpR6m700
         yWUs4TViZwtHkb4dJMEoU+KuBm93M8guvYm1ZfNHV0IDJtSXdOlYwphGDlgF3NZkzqqH
         7otQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702929; x=1733307729;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qz+EP+l7Qi3fy38Fu3GsKedJkFdI7GfNaCEpN7e8AWQ=;
        b=nHo65z5Ep9AuzeUo28x1Ox9eQkuGPOIntYPa5uqAnw6Q77NUgXiyuMxkl0ffubq/6n
         oda8I0S+sQ5fMCBUAvO578vlKoMexPLujSCxthFqsks02Kyz9Tkd4f2dURAozucj25Wz
         fVB0ca1pFo82MjA//wp042WJh+gK652xHXcBFiEkp4dmuoDnAJT3gPAQ9vOwEzVWtdmx
         mcwFtA+YzdjPUDRT3ikz7yH3sf7WZmNFLQS+WJs/LiYAHUL54XCKO3LLafH/sYhWwaxv
         YoV45Nr+nkg628ydneU9B19c1CRx7wMV55dGsGuOo8XyRcmGuFfQZJMxOaZDQr3QjCF9
         HCGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrGzjiPIDoTvGwaVfSN+cpyFscGJ6DigkDQ6lwtGR33g/UCbck0oCSCf+8G46Dzecrl0A9KA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeACvlHmsKzhBtPsFwg7mec4CDYQS2smPWacsVKkCC8wNAjJbH
	LP77nbTqzTdGDNnwi/Kxm0lehQtGEwMjOWKGXnvP2L9ok5Fw8JRZ6F4iMw==
X-Gm-Gg: ASbGncvEfKu4nmMZhU/IwSFM/9hPeZh3OXsq0KlzLULWrfX/ZwiNqgk7HAJqddT+NyN
	brxtzDo5KA9HTSt+eIdq4L5BcVZj9f0UjHQZ1mO+jSMmwB8+zPJIaEKwsEuFUfWSoewgOJidsOT
	wH1M+oHY3gR8+UipVkU2Tho4+K8/AXE27zgXFsPaj+rVHcs/Q0zLfsiaiZNmq6iESGGC03uuxw1
	B5QeR2RIHfpJMN96p9edTgp3KLMgbL38XaRPj1hDHEb35D/k9U5NTYz
X-Google-Smtp-Source: AGHT+IGjRx2ovLJ/PK1xeg/mE4q6TiXnbUVeTxirN9MONHEAnthNoTHl5RsWr+Fkoonsn8w1pCxhfw==
X-Received: by 2002:a17:902:ec84:b0:211:9316:da12 with SMTP id d9443c01a7336-21501381d49mr27610445ad.22.1732702929243;
        Wed, 27 Nov 2024 02:22:09 -0800 (PST)
Received: from ?IPv6:::1? ([2601:647:5e00:4acd:e351:853:196c:a120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba3588sm99445525ad.86.2024.11.27.02.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 02:22:08 -0800 (PST)
Date: Wed, 27 Nov 2024 02:22:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
CC: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/4=5D_input=3A_apple=5Fz2=3A_Ad?=
 =?US-ASCII?Q?d_a_driver_for_Apple_Z2_touchscreens?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMT+MTRTzPwo7QveP5Zt_4Zycu1qohe5g8srC8O8Jo+O+-wLJw@mail.gmail.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-2-c43c4cc6200d@gmail.com> <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43> <CAMT+MTRTzPwo7QveP5Zt_4Zycu1qohe5g8srC8O8Jo+O+-wLJw@mail.gmail.com>
Message-ID: <3FA9FD56-ECF4-4E2C-A300-7E552F60987D@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 27, 2024 2:19:38 AM PST, Sasha Finkelstein <fnkl=2Ekernel@gmail=
=2Ecom> wrote:
>On Wed, 27 Nov 2024 at 10:00, Krzysztof Kozlowski <krzk@kernel=2Eorg> wro=
te:
>> > +             dev_err(dev, "unable to get reset");
>>
>> Syntax is: return dev_err_probe, almost everywhere here=2E
>
>Per discussion on previous version of this series, input asks
>dev_err_probe to not be used=2E

They twisted my arm=2E It's ok to use now=2E=20

Thanks=2E


--=20
Dmitry
