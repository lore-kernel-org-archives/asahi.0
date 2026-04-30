Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8A33822A2
	for <asahi@lists.linux.dev>; Thu, 30 Apr 2026 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777578896; cv=none; b=tBQ56jnpXGkR8trBBeOv22h98L8Oi3u5Ds9Q3NUxDw3th4qBWhc1S5IiQnVteFR36SuzA/XIfpP5gqSx+BCLVj7xCUuUsnB5RMpcucD00RbxUSAvo9NQv2TUtUONe2IxGtDv12EM4/1iaXDkNHYvJ2G5ALPSjsm/Qg1oJmroIKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777578896; c=relaxed/simple;
	bh=mTShDs3qFh8Xph4TeQW7wpoAVzLqWhiZ9mAFw583TTI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=jNpZcAemsJjuTM0hPsNfxe/bBrIz1oh4s66Py39xqimYwNYCjQaUBh9ZMl/zGJCKHy0vmP7HouL/d8RruI33IAy2tX4PbSW9mk4miCqngrfKQiXV4RVg+Xhdk8dYh4wZmCMSKzERm8V0DBB7pAkUJ33rT8kdjHAttS9FVDuhcBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=C3VOw6Bq; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="C3VOw6Bq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Cc: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1777578886;
 bh=EbR5+jcTj2Ecv9c7ESRhGNAPx8DtjjuvHNmmdJxNTMU=;
 b=C3VOw6BqcqxuQkcgx2wGTGYs2e2dPuVpr00UPKlc7p4saGhjT7VD4KE4TN7ukbhA3ipRwjNvG
 MtrXp8qMXcov88zjkRj/pQq3rNUBcvcZrkWLYVlcPNpoz02uOlJVLHvdC98T8X0cJXUFVxsrqPG
 fL0a69O2c+NBdbiwKSAnoxsNQfiq1IfJnEmKKxeolNK6MlVK93EkzPIVuUf0pOowctNO/sG1wnW
 PHbn+tg3FiY36SHtORdNcNRnVfGMYAWyVVXKxUQK50MgZBCwVrONfVmr8dBbJGlw8475GCHVbzn
 Ahh8pQrytty4nXxTPifxrNYDhF+mZa/fGac5hKfaQ6rQ==
X-Forward-Email-ID: 69f3b382d1381ba2713053ad
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.7.7
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
Date: Thu, 30 Apr 2026 15:54:39 -0400
Message-Id: <DI6R4FYDSY08.LDHU6EZTXS9X@ubuntu.com>
Subject: Re: [PATCH 2/2] cpufreq: apple-soc: Use FIELD_MODIFY()
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Hans Zhang" <18255117159@163.com>, <ray.huang@amd.com>,
 <mario.limonciello@amd.com>, <rafael@kernel.org>,
 <viresh.kumar@linaro.org>, <sven@kernel.org>, <j@jannau.net>
Cc: <perry.yuan@amd.com>, <kprateek.nayak@amd.com>, <neal@gompa.dev>,
 <linux-pm@vger.kernel.org>, <asahi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260430163213.44695-1-18255117159@163.com>
 <20260430163213.44695-3-18255117159@163.com>
In-Reply-To: <20260430163213.44695-3-18255117159@163.com>

On Thu Apr 30, 2026 at 12:32 PM EDT, Hans Zhang wrote:
> Use FIELD_MODIFY() to remove open-coded bit manipulation.
> No functional change intended.
>
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-=
soc-cpufreq.c
> index 9396034167e5..638e5bf72185 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -187,10 +187,8 @@ static int apple_soc_cpufreq_set_target(struct cpufr=
eq_policy *policy,
> =20
>  	reg &=3D ~priv->info->ps1_mask;
>  	reg |=3D pstate << priv->info->ps1_shift;
> -	if (priv->info->has_ps2) {
> -		reg &=3D ~APPLE_DVFS_CMD_PS2;
> -		reg |=3D FIELD_PREP(APPLE_DVFS_CMD_PS2, pstate);
> -	}
> +	if (priv->info->has_ps2)
> +		FIELD_MODIFY(APPLE_DVFS_CMD_PS2, &reg, pstate);
>  	reg |=3D APPLE_DVFS_CMD_SET;
> =20
>  	writeq_relaxed(reg, priv->reg_base + APPLE_DVFS_CMD);

Looks okay.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
