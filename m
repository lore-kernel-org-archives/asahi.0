Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FED39B94D
	for <asahi@lists.linux.dev>; Sun, 19 Jul 2026 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784474913; cv=none; b=cRem371hDXJ9uyvUMxLcAsYWMPpnCG9yHaMhQ2K+uX0bXncJj0MRXT0BIIToTPziVd8aQXf/bmSCn44h0WL4Yr1eAa2w5b9U4Y/VuBdOlQGyKWDbDtYhalUwnzSJ0ZEGgrGSJIBsX0WCV34/jU6Brtiz9WJmtpFJIa3PGuT3V+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784474913; c=relaxed/simple;
	bh=z3bcQYkQZt/TrC3+4/QDswAa5KSqpmEtZ/5nFygMrjc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DVqI4J6Kry4TxYqGvrZMV/zqCOQCtwK+Al55yilYbSERvUO+bYaygBnyYMcgKwQqr8bTTEYxxZkMV38/CnF908wlU/uu/pojNGRNTPQ8qwazW6mH3b7g2YumE7hgyYUCsn5poihWq26N2R5MoXk3Apu/tF7LOmRoLvktAQh7WrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=cwzBul+N; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="cwzBul+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1784474910;
 bh=z3bcQYkQZt/TrC3+4/QDswAa5KSqpmEtZ/5nFygMrjc=;
 b=cwzBul+NR2oGbbdUNNxD9q4/HCjAeD5SeD2HgwCILB4L34G/J6ppaDPOyI70+d/hcxspGU9jK
 66dlZXQ3ZduTw2Qzu56KzHowUudXfpI/ZYjlr7xpNKVzEdQ2Hr1VQMIIV7E3nKQhGK6s2e+X1Cn
 hrotFYBv/hJu2ki4U/lmC6m2QER/W+qrvlNb0lnvVFFmHhAZE9DZUnRuPPXBaTOMmT80GbCs3g2
 dC9cJuBYMjkTW2C1nJ9VO68vZRuQE8jLEk9W+zijrSRIm/++N3BaPb5LRRFM4ZfInTKpNcZCtAc
 wHZmEp/O3cq3lVm+7EKt8EuKE9pafT8cYyJVvNM1l4Ew==
X-Forward-Email-ID: 6a5ced1adf3bed975f54cda3
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.11.4
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
Date: Sun, 19 Jul 2026 11:28:25 -0400
Message-Id: <DK2NK6ERU0Z6.3FEOZDJN7UP74@ubuntu.com>
Cc: <asahi@lists.linux.dev>, "Janne Grunau" <j@jannau.net>, "Lee Jones"
 <lee@kernel.org>, "Neal Gompa" <neal@gompa.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] mfd: macsmc: Fix key count endianness annotation
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Joshua Peisach" <jpeisach@ubuntu.com>
X-Mailer: aerc 0.21.0
References: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
 <DK2N0ITFL309.1Y5VHF18YIQ7M@ubuntu.com>
 <07d37cf5-d49d-4507-82c8-7c6d8c9e01af@kernel.org>
In-Reply-To: <07d37cf5-d49d-4507-82c8-7c6d8c9e01af@kernel.org>

On Sun Jul 19, 2026 at 11:15 AM EDT, Sven Peter wrote:
>
>
> On 7/19/26 17:02, Joshua Peisach wrote:
>> On Sun Jul 19, 2026 at 9:00 AM EDT, Sven Peter wrote:
>>> SMC firmware returns the value of the #KEY key in big-endian unlike mos=
t
>>> other keys. Reading it through apple_smc_read_u32() into a plain u32
>>> and then converting with be32_to_cpu() makes sparse complain:
>>>
>>> =C2=A0 drivers/mfd/macsmc.c:462:26: sparse: cast to restricted __be32
>>>
>>> Read the raw value into a __be32 using apple_smc_read() instead.
>>>
>>> Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management=20
>>> Controller")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes:=20
>>> https://lore.kernel.org/oe-kbuild-all/202607181046.OANjIoqR-lkp@intel.c=
om/
>>> Signed-off-by: Sven Peter <sven@kernel.org>
>>> ---
>>> =C2=A0drivers/mfd/macsmc.c | 8 +++++---
>>> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
>>> index 358feec2d088..514cba7dc897 100644
>>> --- a/drivers/mfd/macsmc.c
>>> +++ b/drivers/mfd/macsmc.c
>>> @@ -410,7 +410,7 @@ static int apple_smc_probe(struct platform_device=
=20
>>> *pdev)
>>> =C2=A0{
>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev =3D &pdev->dev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct apple_smc *smc;
>>> -=C2=A0=C2=A0=C2=A0 u32 count;
>>> +=C2=A0=C2=A0=C2=A0 __be32 count;
>>> =C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 smc =3D devm_kzalloc(dev, sizeof(*smc), GFP_KE=
RNEL);
>>> @@ -461,8 +461,10 @@ static int apple_smc_probe(struct=20
>>> platform_device *pdev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 dev_set_drvdata(&pdev->dev, smc);
>>> =C2=A0=C2=A0=C2=A0=C2=A0 BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handle=
rs);
>>>
>>> -=C2=A0=C2=A0=C2=A0 ret =3D apple_smc_read_u32(smc, SMC_KEY(#KEY), &cou=
nt);
>>> -=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0 ret =3D apple_smc_read(smc, SMC_KEY(#KEY), &count, =
sizeof(count));
>>> +=C2=A0=C2=A0=C2=A0 if (ret >=3D 0 && ret !=3D sizeof(count))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(s=
mc->dev, ret, "Failed to get key count");
>>> =C2=A0=C2=A0=C2=A0=C2=A0 smc->key_count =3D be32_to_cpu(count);
>>
>> This makes sense, it just feels weird reading because u32 is.. not a
>> be32 (that gets passed into be32_to_cpu).
>
> count is __be32 now (the SMC firmware returns that value as big-endian=20
> because Apple likes to think different) and we read that using=20
> apple_smc_read now which just reads raw bytes. be32_to_cpu then converts=
=20
> that to a u32, i.e. the type of smc->key_count. There's no functional=20
> change here. What's weird about that?
>
>
> Sven

Pfft, brain fart. I thought you were going other way around.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
