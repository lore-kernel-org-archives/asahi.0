Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62759308F27
	for <asahi@lists.linux.dev>; Fri, 28 Nov 2025 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764326228; cv=none; b=EWA55ACnpPkw0QWPinSbJbM6ryyl59K6AuPLDOr/NmqCXAvxKqJ8gNoJpb3He7xHpJGnzOwHaFHkq6f0AAiuLRTvBZoLV9xGaEUWHlObTSd0Yw+uw4e4if4KUfWxnVTUKskIokDPs0oojBPbVuvbVS8P2Tsh4ktECSHVXPyZv/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764326228; c=relaxed/simple;
	bh=LsjBUCj2srMne7edzgGW8cbMkZIkCTv5yV9uYfkGBBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVElaWggcy2TeGU1FUyND++xTmhdnn0Exr7dXUg+2vBES6baCXqeoPsvuHxT4BAWQxzTCHh11q2RNL00yXjX3dcTOyg1w1y4AvCBJUu2gffLAcuIbe6wVH1VP2z/RiYwSHxPHfxwKrNpScLBg6WqMbSNmAk+/snOuTBX1CEjNyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYXZiHbP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYXZiHbP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29586626fbeso22023595ad.0
        for <asahi@lists.linux.dev>; Fri, 28 Nov 2025 02:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764326226; x=1764931026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=;
        b=RYXZiHbPANxUZEyyiK3fh0eLqtMWmDpGaIi6LsHor2zgJTYYDLOwC7oLfyynqevHD8
         YiV2V5SVKsoTEzPqACd4lgsr5xmQamgDgJMJUEqWUWPi7vGvSA1kPqINV4KCEBTVr3xM
         18gN62CQ1JYp5l4K4V8nT3hFYCAbdY2vy4tRa2iudTak2YC2iEleONOwe55TlSV94d0C
         z+Igk0NTU+5SyYeDwB0Rm+5PyaYpQlGgDpoj4/sZj6PV1DiaHCgygESEfABuOyB2+LoO
         J3EcGOvumnh3xcWH3zd++akqCnt3xPGbKVgSGhYlxp6q+JpL5rohKDlBjoUZOrCKUWXn
         YmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764326226; x=1764931026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4VICBTALhOgKQ11NcNnDdPOSrcRxYndkOphogjBgx4=;
        b=NlbnbccOA84WNRuBCXWOaktUjVdPFhe8yxZF+6F9yS7T7o9mnnwY3m0UeGrDWVM8BL
         P6+bf5yse5F1mjI0qGJupEXvX9tv7jWRSGh1jgop3Zp+8xofrOuolqau/HU/66cAJevV
         eLkhKXyO35KhRIZNBQyBrBo3svDRPI+GXnh4iTmZznNIyKFm2WZ0K4o2nFEyKgTO0vfZ
         DlnyVG/NzAoKDoU1Q1S5BeyI7YmWX/dPucqE8+vuxdpPs2wrcCO0UJgHhS+xjP7PXsCo
         P9vPEuPBJNJe+AekgqnnnxtcEUqzNmaIIaHc6I1LWn2/+SutyBONmGSafEQysLCyosHM
         hJ6w==
X-Forwarded-Encrypted: i=1; AJvYcCWU/6yK+xmokoy8o7csNv9tAaxYQi0L8Ewz3qang/X5gzZxdY6xOT775TZJ0r6dSWIYJJvrTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVzo6F6fsIvudA2aDw6ExhSo5zCfekZCNbshz8KBbe7EEjLjtm
	8TczSBwfwfw5tcG5pyqV+Qz+2MaBuoyJZv2zfw5g+pI9tV7xpnHkhH5l
X-Gm-Gg: ASbGnct/Be+JkYQ5DQ2J+/88+xU8tj3r6sIbw0+/Ceni4iLXCGq9PQqjv2nC87oYzJJ
	iNeve7q+DkKzJQgS2mepcS/vMOdZSns2P6cs+ijkp3IAej5KVqsdlonjYOn+u6YscW5lBWgtXGT
	gEjFnJbERkqcnx4yFDNNqCNL2FAXeoeDKCQjA6wYymWJoEHn3LX6uT/Yf2Y0/r/++0oYm9L7JqB
	6P1VL/XtMA4VmA6uqQ2viTW9tk1UjNL+uI5wbl+GmXIWCAegGa53t7GvAqVJ/x40blRybUgz3F+
	rrGez6cSsyo24gWgqqCdRrlVHtsG2Qo11nzPP1xdG6udcfwtgiwxJu5G/silpo3zMl0sywccf7y
	AXh0fzks3kakr3DWjy5uEK0XcKDxjcDTTUMfhHpCQ1Jo0OPoh5+s7MPm54NzXBS5VyqNNlmBp35
	GgjeB972PMx8fSVlMm9LQG85Y2XAfZW07C+PrVkl1MYaTeznAhqgUK01DMu+9WipWXR2/qe72yy
	Y82DC1XsK8PzC28RlL6O750XuFujrtMpWz701USEGbNUZYGQIH1g5ckYTcHn+M8YmmhlduFUtMZ
	rgYoDOC85cZLzq83JXpM7po3ztCBFuWd9C8uDFZsILVLHMgYPsNLdg4=
X-Google-Smtp-Source: AGHT+IGMXq1Dh7hKw7TbowlI22iUZ08cEdFKrn/i/FIQAiWpJQ+dGpYRwCov3xkXMTBkJf1Am/GMAQ==
X-Received: by 2002:a17:903:b84:b0:295:b7a3:30e6 with SMTP id d9443c01a7336-29b6bec45damr309873285ad.18.1764326225590;
        Fri, 28 Nov 2025 02:37:05 -0800 (PST)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm41643525ad.41.2025.11.28.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:37:05 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Date: Fri, 28 Nov 2025 20:36:56 +1000
Message-ID: <1938104.tdWV9SEqCh@setsuna>
In-Reply-To: <20251120134445.GC661940@google.com>
References:
 <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
 <20251120134445.GC661940@google.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 20 November 2025 11:44:45=E2=80=AFpm Australian Eastern Standa=
rd Time Lee=20
Jones wrote:
> On Wed, 12 Nov 2025, James Calligeros wrote:
> > When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 err=
ors
> > out with 'case label does not reduce to an integer constant'. Introduce
> > a new __SMC_KEY macro that can be used instead.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/linux/mfd/macsmc.h | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
> > index 6b13f01a8592..f6f80c33b5cf 100644
> > --- a/include/linux/mfd/macsmc.h
> > +++ b/include/linux/mfd/macsmc.h
> > @@ -41,6 +41,7 @@ typedef u32 smc_key;
> >=20
> >   */
> > =20
> >  #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
> >  #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) |
> >  (s)[3])>=20
> > +#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) |
> > ((u32)(c) << 8) | ((u32)(d)))
> Are we expecting users/consumers to be able to tell the difference
> between SMC_KEY and __SMC_KEY (assuming that _SMC_KEY is just an
> internal)?

_SMC_KEY is used in the gpio driver, and I would have used it here too if n=
ot=20
for GCC complaining about it. I wouldn't expect anyone to want to use=20
__SMC_KEY outside of the specific use case this commit addresses given the=
=20
suboptimal ergonomics.

> I have not tested this and it is just off the top of my head, but does
> this work:
>=20
> #define _SMC_KEY(s) __SMC_KEY((s)[0], (s)[1], (s)[2], (s)[3])

This works fine on a smattering of M1 and M2 series machines. I can submit =
a=20
v6 with this and the hwmon driver dropped if need be.

Regards,
James


