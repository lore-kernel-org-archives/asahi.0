Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506803CC7FF
	for <asahi@lists.linux.dev>; Mon,  6 Jul 2026 23:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783380567; cv=none; b=FQ73GgbXTZZowc+wPiE8f9j5nKn8tpSK/Gnj+ysmWPBq2nLyQTs20Ww8mK3nfXRVB6Jhd6Ghf/0DI1nJ1ORYSprbatxYChWAnoya7dy3TWRb8WQXyAoTVdapQzIn+0S4M1FfzeZ22p9EuXpjhUl1oBMxRGzp+5ZuBhPcG/keGBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783380567; c=relaxed/simple;
	bh=xXx9ghtDXdcnOVa0JS+aJabtBtx0SXhjqKDY7OeXIJQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=bofvZhp72mSMRG7tahIraeBiw1Y8a+lbxazxNl63a/DXyuJUNKcPxzqmvt+7dmJdrP8/GydgjYgcA6t6Kx0ZM2K4AWd/wBZE51NjA0pVR2hGcsKTO4i2BvI0WdHR2zO0iWDqwQqOEC5kS+j2ALxdtot3OLhCLp55omKQDxQwefs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=bQxInU73; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="bQxInU73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: From: Subject: Cc: To: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1783380565;
 bh=yxU8CHzvkTqWab+IeF9EPpfT2XdfzFSqHKpwnRwHBpU=;
 b=bQxInU73AnpAKFmmmnFArqb0bcR9ulPfvRTPknwEMYWtrIMFQmipvCCUzeOs0389vDjSkoYNN
 cp6IuAdrRn4dXzgN+H7juxGObxzUSajas2Pthm567WBKDBSbiN2AGtuTrvIwDyY6U1unlS/4+k3
 og7DxOMLBoTE3L3cS4e/76xp9PtXSvNFjscxj268zRsHHTNqfiO2VF9ro1yRiTGJHMYavZDqQr/
 3B5KulI7ZGx3zUy0TSFDu431oU0nOQ1G1+cqKT3kjuX5l0tvXScGeiMou3tz59+TvJnDK1xD4nj
 HbxnB67xXrcR5DrmTDgOxOjYueVZzcWneXYNT5nIEfcw==
X-Forward-Email-ID: 6a4c3a4e49befa328926c594
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.9.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 06 Jul 2026 19:29:15 -0400
Message-Id: <DJRVN972B27A.XI5EE88SRI89@ubuntu.com>
To: "Sasha Finkelstein" <k@chaosmail.tech>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>, "Hector Martin" <marcan@marcan.st>
Subject: Re: [PATCH v3 0/3] soc: apple: Add "PMGR misc" power controls
 driver
From: "Joshua Peisach" <jpeisach@ubuntu.com>
X-Mailer: aerc 0.21.0
References: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
In-Reply-To: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>

On Sun Jul 5, 2026 at 4:16 AM EDT, Sasha Finkelstein wrote:
> Certain Apple SoCs have additional power state controls that are using
> a separate "misc" mmio interface. Currently this includes the fabric
> and memory controllers on pro/max/ultra SoCs.
>
> This series adds a driver to put those in a low power state when the
> machine enters sleep. The power savings are SoC-dependent and are
> around 1W.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v3:
> - Remove ability to probe only one control, it is not used anyway
> - Allow building as module
> - Style fixes
> - Link to v2: https://patch.msgid.link/20260703-pmgr-misc-v2-0-4b26ba10c5=
a4@chaosmail.tech
>
> Changes in v2:
> - Error handling fixes
> - Reword binding description
> - Link to v1: https://patch.msgid.link/20260702-pmgr-misc-v1-0-4f075a3a95=
c1@chaosmail.tech
>
> ---
> Hector Martin (1):
>       soc: apple: Add driver for Apple PMGR misc controls
>
> Sasha Finkelstein (2):
>       dt-bindings: soc: apple: Add Apple PMGR misc controls
>       arm64: dts: apple: Add pmgr-misc nodes to t60xx
>
>  Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml |=
  45 +++++++++++++++++++++++++++
>  MAINTAINERS                                                            |=
   1 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi                              |=
   7 +++++
>  arch/arm64/boot/dts/apple/t602x-die0.dtsi                              |=
   7 +++++
>  drivers/soc/apple/Kconfig                                              |=
  10 ++++++
>  drivers/soc/apple/Makefile                                             |=
   2 ++
>  drivers/soc/apple/apple-pmgr-misc.c                                    |=
 181 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++
>  7 files changed, 253 insertions(+)
> ---
> base-commit: e5d9690657844a2645a518cdf838206f6daf513e
> change-id: 20260702-pmgr-misc-ae1cbd5bc2c7
>
> Best regards,
> -- =20
> Sasha Finkelstein <k@chaosmail.tech>

Seems fine.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
