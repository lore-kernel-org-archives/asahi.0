Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9BE3126A1
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973124; cv=none; b=lIS8A9gM6qnsq0HDGZnApd7WFQFX38VGGzZX2lsgIHPdZxrESOhWimjb5cHWbXSstQq9Hw4k8Oyh2S2Hm8v3fw4t2yjDv+McCiTykkirmMrsrf3G0ycFBP2feJasftGsoOCMBYZIOeA2PhRdrq7csfOvNJV1uMP8w5TCLWxtEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973124; c=relaxed/simple;
	bh=p/mIE32UAw2Rs/kcvZDW+nus0i7GczFKbTrSrUnMef4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnc0MFO49njwaKmdUG2ZOcVvKx43IqHvkxPofT1DHHM+7PONU6VpQYexTd03tuDovonGY5a8qUN8Z71IkSVE8Fd6j+OQPzvLU4BmmWRGAogvuTXDwJCOEfVMgFoqjEsQi92eOn7JMmHD6+2kH1T/j8ji/pJBaiI44x9aQxvsmu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-7c95936e43cso1694838a34.0
        for <asahi@lists.linux.dev>; Fri, 09 Jan 2026 07:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973121; x=1768577921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SpPrLFd5v/6zJO4WFk35tcM0BKmalPeYgZG+F55tnbQ=;
        b=daIRQbIhMCTgJKQ9ZA71SHwYrM2s/LFZvpI1eIHeTqwqDhfJsafJP/UkXg3evye8/S
         MCfzJF3HfMXQNaNfJOJWC8U0ZkeMrA4D+IfiTHTTvnykfUFCTyyYbstHhR05gmpE3vMb
         YtcI1CWa4Dep0CngdWReGCea1uX9zBjI4Hz+6oEloRXxX1seAItT6/UfbJRswPiav677
         BliciGJL87WlG7BZ/vvQmSHj4TsR9XrUIOMs35kQ4JfCXYyhw86SeoouAJ91gleoBbhf
         rhN6RESRrley6bNs3B07Dqes2gTIcSCX6P5qBsNZMtDk3n3rd1+DdQUR6388m+JlTPng
         nStA==
X-Forwarded-Encrypted: i=1; AJvYcCW+CNsZI4eU9FT0Vb0+ZHqtMStzrLp5VKCcjZZicbf01nyiml325JVe/hCW0ZrafztjoFT2jQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmI2jrNj819xWmzRlqPeqPxLhnuRCxYMrT9oTjz6WBCh4wmCbN
	13dKUiLF4ortXYqgr8tymIrZMguGQxprfRSkwAl8H4AK0Bpfmxn/eIXSQyKUQydu
X-Gm-Gg: AY/fxX502bnGPmoAzPG7YlKjKrH6pWdgyVeomxCJGC+TPwkg1K+63Szd8HKb04VeFNh
	2abnndaCltg3Kmi1wPs9d9S2yEf9avCi/PeVgoUpTcj/k5HX813DV8BT2Vj2cf6wc2aDDRumK6X
	qWH3ILI5OFG+XuhOeIlIMLdMT+pAV2pNG/8AyRnNUBVwGDoC+7bcxwqg54MVDsrpyMPH1ke53zL
	p2gTVMcC8vsmsu3STtnPsitTwXCkJxk4wvIBCRUtywwRYXvGy+rzS7fhhg5HWnTFawPUG4MwKL5
	wj9HTQUzxv9TVIv0MDBEx0Nrs0I8/5bzA9hne+1oDXqfo4TL1Qjl9QgHMNSeAOUciuAhxt7e8gp
	yWGYxB1dVsd7bJohm2mDFUSqVwkfEhKZtmKPRGciN7YLwoygCGgLsfn0BN53uIlmgNEnwSlyAPh
	c5IxVE3djlH2DB1o0TjVcuR7Fw683iQAvjTSgDJgBN3WJcp7H6dcn8dQueRQFRVGAJTrVSEk2k3
	V2xXG0K8UY=
X-Google-Smtp-Source: AGHT+IFbdVKt0memUvNgyHsUpSMtddwzF0U4jAct2ZdyEv558lDN0e3y5zWEEZozNmS2hbQna3FTbA==
X-Received: by 2002:a05:6830:7189:b0:7ca:e8bf:8c4b with SMTP id 46e09a7af769-7ce5090b7b9mr5644818a34.9.1767973121066;
        Fri, 09 Jan 2026 07:38:41 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9f54sm7825943a34.23.2026.01.09.07.38.39
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:38:40 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c6d3676455so2235675a34.2
        for <asahi@lists.linux.dev>; Fri, 09 Jan 2026 07:38:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULGvaBUMH4/XOmCpjRQURB0e/U8zbsEi1WFupvys26dQzJMbAc8YzDCktyE19Qms2Br1D8ug==@lists.linux.dev
X-Received: by 2002:a05:6830:1cc2:b0:7c5:3045:6c6f with SMTP id
 46e09a7af769-7ce50a28c93mr6289620a34.20.1767973119475; Fri, 09 Jan 2026
 07:38:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
In-Reply-To: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 9 Jan 2026 10:38:02 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9Df0XkVUBmy1DV98VOaHT1tZR3kgPQGupViR-z_0TsYw@mail.gmail.com>
X-Gm-Features: AQt7F2rwR9BSvl9s1TsweiM258RIcrVrEtCNI80i8QBJax18vd1G319kNAidJ6o
Message-ID: <CAEg-Je9Df0XkVUBmy1DV98VOaHT1tZR3kgPQGupViR-z_0TsYw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: apple: Add integrated USB Type-C ports
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, R <rqou@berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 9:07=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Now that all dependencies for USB 2.0 and 3.x support are either merged
> (tipd changes in v6.18, dwc3-apple in v6.19-rc1) or in linux-next (Apple
> Type-C PHY) prepare device tree changes to expose the ports.
>
> Each port on Apple silicon devices is driven by a separate collection of
> hardware blocks. For USB 2.0 and 3.x the collection consists of:
> - Apple Type-C PHY, combo PHY for USB 2.0, USB 3.x, USB4/Thunderbolt and
>   DisplayPort
> - Synopsys Designware dwc3 USB controller
> - two DART iommu instances for dwc3
> - CD321x USB PD controller (similar to Ti's TPS6598x series)
>
> The CD321x nodes are already present so this series add the remaining
> devices nodes, typec connector nodes and connections between all
> components.
>
> The devices expose except for a few exceptions noted below all ports. M1
> and M2 have two ports, M1 and M2 Pro and Max have four ports and
> M1 and M2 Ultra have eight ports.
> The Pro and Max based Macbook Pros use only three ports. The fourth port
> is used as DisplayPort PHY to drive a HDMI output via an integrated
> DP to HDMI converter.
> The Ultra based Mac studio devices only use six ports. The third and
> fourth port on the second die is completely fused off.
>
> The changes for t600x and t602x are in a single commit since the devices
> share .dtsi files across SoC generations due to their similarity.
>
> Depends on commit c1538b87caef ("dt-bindings: phy: Add Apple Type-C
> PHY") in linux-phy's [1] next branch for `make dtbs_check` to pass.
> checkpatch warns about the undocumented DT compatible strings
> "apple,t8112-atcphy", "apple,t6000-atcphy" and "apple,t6020-atcphy" but
> not about "apple,t8103-atcphy". I don't under why it doesn't warn about
> the last. "apple,t8103-atcphy" is only found in the added devicetree
> files and nowhere else in v6.19-rc1.
>
> Tested on top of next-20260106 on M1, M2, M1 Max and M2 Pro Mac mini /
> Mac studio and a few fixes for dwc3-apple and atc [2, 3, 4, 5].
>
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/ =
[1]
> Link: https://lore.kernel.org/asahi/20260104-atcphy-tunable-fix-v2-1-84e5=
c2a57aaa@kernel.org/ [2]
> Link: https://lore.kernel.org/asahi/20260108-atcphy-coldboot-fix-v1-1-01c=
41c6e84f2@kernel.org/ [3]
> Link: https://lore.kernel.org/asahi/20260108-dwc3-apple-usb2phy-fix-v1-1-=
5dd7bc642040@kernel.org/ [4]
> Link: https://lore.kernel.org/asahi/20260109-apple-dwc3-role-switch-v1-1-=
11623b0f6222@jannau.net/ [5]
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hector Martin (2):
>       arm64: dts: apple: t8103: Add nodes for integrated USB Type-C ports
>       arm64: dts: apple: t8112: Add nodes for integrated USB Type-C ports
>
> Janne Grunau (1):
>       arm64: dts: apple: t60xx: Add nodes for integrated USB Type-C ports
>
>  arch/arm64/boot/dts/apple/t6001.dtsi           |   1 +
>  arch/arm64/boot/dts/apple/t6002-j375d.dts      | 150 +++++++++
>  arch/arm64/boot/dts/apple/t6002.dtsi           |   1 +
>  arch/arm64/boot/dts/apple/t600x-dieX.dtsi      | 212 +++++++++++++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 234 ++++++++++++++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 270 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t6022-j180d.dts      | 415 +++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/apple/t6022-j475d.dts      |  31 ++
>  arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi     | 133 ++++++++
>  arch/arm64/boot/dts/apple/t602x-dieX.dtsi      | 212 +++++++++++++
>  arch/arm64/boot/dts/apple/t8103-j274.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8103-j313.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8103-j456.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8103-j457.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      | 134 ++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi           | 105 +++++++
>  arch/arm64/boot/dts/apple/t8112-j413.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8112-j415.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8112-j473.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts       |  12 +
>  arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      | 134 ++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi           | 105 +++++++
>  23 files changed, 2245 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260109-apple-dt-usb-c-atc-dwc3-c4f7853c85e2
>


LGTM, thanks for this!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
