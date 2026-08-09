Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD133AFD1C
	for <asahi@lists.linux.dev>; Sun,  9 Aug 2026 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786295614; cv=none; b=o0+evwQwK44UcAe1jmJavOFtgCtXC/V+tWuJ4vQC+g4HLuSuJwf036+b06y4WO4K9NKp7JklUBdTuoKml/d64knhYQ6kHhVO/vZ4PEkSCluhxyntB+Qw72yP2U0rQAEd+vcvec1sN/yiRp5WbQkIVWU65KuAnbh/+Shf5T56x7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786295614; c=relaxed/simple;
	bh=sdkVaGxQ9WXK8ISzY26/7j0yy/WLWXIs5Q/P9RAMv4U=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=eL1Xq0wRL5hSTH8XaDYJ+7qKvBgA1WbOU99ayKShrK2aqnfuq1HdI5WRStecPVKe85nxitXJckniJghw5lTNGLfQb9cY2pb04Y/1XSXWf4rhpAejxv7O4S50CHxBrdgEOeDcUiL1C/bBwpbemburMUtvvYbENhQ1KXamSyU+8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=ny5z0xwX; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="ny5z0xwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1786295608;
 bh=sdkVaGxQ9WXK8ISzY26/7j0yy/WLWXIs5Q/P9RAMv4U=;
 b=ny5z0xwXITBGAIGrWi1n18JPR9+SDeWGrr6Of43/oewh6ZJ5Ry0dNKw1Qll5bz783s8seSgj+
 msHYQz3PZktSQey3zZJUXa9MyvdKrSGCDZWrNI0gy8WxWLh8hpfrIhjxlwuBX5J2AHkliAKJBkH
 VqCu477AMtuiFAJAmrmRhX8aKGdl4FQlQbNGUhtHVB9NXkGVyT1dCDAqi1i2t79FLUxNmL27Oju
 PpX6HE2SQYFjVsEbtEMLDsp2QP56sz9yyfqOsumBCMO/IvyXq+n/TIMhGHlsPNbPLsvJuVN+Oy6
 l6R9kZJldHgnhBCSNUK7zUa/ShXavqMbTYTJt1DL+46g==
X-Forward-Email-ID: 6a78b531430e5f5f6cba74ac
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.13.10
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
Date: Sun, 09 Aug 2026 13:13:18 -0400
Message-Id: <DKKKXXEMIO2G.LN1EYSEBL8CD@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Joshua Peisach" <jpeisach@ubuntu.com>
Cc: <asahi@lists.linux.dev>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Neal Gompa" <neal@gompa.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Janne
 Grunau" <j@jannau.net>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/3] reset: Add Apple SoC CIO reset driver
X-Mailer: aerc 0.21.0
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-2-4f33777d9b4b@kernel.org>
 <DKKHHITWR3F4.390HXQFLQR8X5@ubuntu.com>
 <7a170485-b349-4502-adb1-3ce6217bc435@kernel.org>
In-Reply-To: <7a170485-b349-4502-adb1-3ce6217bc435@kernel.org>

On Sun Aug 9, 2026 at 11:20 AM EDT, Sven Peter wrote:
> On 09.08.26 16:30, Joshua Peisach wrote:
>> On Sun Aug 9, 2026 at 8:16 AM EDT, Sven Peter wrote:
>>> Add a driver for the reset of the CIO (USB4/Thunderbolt) blocks on
>>> Apple Silicon SoCs which has to be deasserted before their
>>> co-processor can be booted. On t8103 each port comes with a dedicated
>>> register page while t600x uses a single register with one request bit
>>> per port shared by all ports of a die inside the PMGR MMIO region.
>>>
>>> Signed-off-by: Sven Peter <sven@kernel.org>
>>> ---
>>> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
>>> =C2=A0drivers/reset/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +++
>>> =C2=A0drivers/reset/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0drivers/reset/reset-apple-cio.c | 182 +++++++++++++++++++++++++++=
++++=20
>>> +++++++++
>>> =C2=A04 files changed, 194 insertions(+)
>>=20
>>> +
>>> +static int apple_cio_reset_probe(struct platform_device *pdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct device *dev =3D &pdev->dev;
>>> +=C2=A0=C2=A0=C2=A0 struct apple_cio_reset *priv;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNE=
L);
>>> +=C2=A0=C2=A0=C2=A0 if (!priv)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 priv->variant =3D of_device_get_match_data(dev);
>>=20
>> Might be a dumb question, but does priv->variant also need to be
>> checked? Because later priv->variant->pmgr_child is and I *think*
>> it could return NULL.
>>=20
>> (Or is this not necessary since in theory the device should only run
>> this if detected... so this should never be an issue?)
>
> You might be able to get this driver to probe without a device tree node=
=20
> by manually forcing it with sysfs but well... play stupid games, win=20
> stupid prizes.
> Adding the check is just two lines and doesn't hurt though.

Meh, not worth the extra lines of instruction. FAFO for the curious.
