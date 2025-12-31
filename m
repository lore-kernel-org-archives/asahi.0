Received: from mail.maslowski.xyz (mail.maslowski.xyz [45.77.158.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230B0258CDF
	for <asahi@lists.linux.dev>; Wed, 31 Dec 2025 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.77.158.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767205327; cv=none; b=XFkJPEvJm5fhCin+Q36pNp8IKxFW8Mcvl9X0hZgAJyG2owI78QEhqpYl8Q7SJoOMVNA/VKCi5gB3jBYBxZ24tSO5E7JdmzRP+UJqcnM1OTFRkS03PKikJocBu7DAqsrWaLgiBFixVjYeWO1L7eCXy+a6Dhh6uuxRMZFDRdHwQe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767205327; c=relaxed/simple;
	bh=ukIz+YmXXIniB0b2ohWyVcvtGKfgOQxdYnCnw+gL+rk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rhUZpLdsNzJHSkbQ/IGvLkgwFedCZI+345lZIWHb1M3+C32PDgFVDOJT7B8SWNTVxlvZP3XAD3jbutToucg9OoqyenSosMZOC67BjT0U3apj8r+R4loBOiao/4AKgixuLH9kJCm5q2coWma/JnCC2JPIaxcMbdDuv0ftX9/MD4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maslowski.xyz; spf=pass smtp.mailfrom=maslowski.xyz; dkim=pass (2048-bit key) header.d=maslowski.xyz header.i=@maslowski.xyz header.b=nwMedLeq; arc=none smtp.client-ip=45.77.158.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maslowski.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maslowski.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maslowski.xyz header.i=@maslowski.xyz header.b="nwMedLeq"
Received: from localhost (unknown [IPv6:2a00:f44:8b3:d5a5:7b2b:659:ea7c:8a59])
	by mail.maslowski.xyz (Postfix) with ESMTPSA id 108237DD15;
	Wed, 31 Dec 2025 18:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maslowski.xyz;
	s=mail; t=1767204856;
	bh=ukIz+YmXXIniB0b2ohWyVcvtGKfgOQxdYnCnw+gL+rk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nwMedLeqIpgdsHyPOSktO7KnbT98FWSJPBXVYrS45JTrCyJqp4nM0zQUgEAwo/Ug3
	 7atXQveIpP+Rof6rC3NlsEHtV38ttcLGJW/wtX3pjyUgLNhhfkLR9PX1o0m0yIIYzv
	 tHmUWB0koMJun2cXqeiZDz9fq+NJajTczAvdWMEXvTclNvpr0PKMAfCK7ASpHedBf6
	 Diy8fOWgUvuxTTrkHFEg7lo+7Cvfe6xLULZ0WZMYWMbGhKHpBITIGwTt76Ltj1EM6J
	 oL5qWaPStYY5igAOr8VLGMXG2EwDzbSqPpoAI2iE6Tq0pGORevLNt056+liFPGIwoW
	 i01QoL3TiIK9Q==
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 19:14:13 +0100
Message-Id: <DFCLU67GQO86.1NY037FRPJ4E2@maslowski.xyz>
Cc: "Nick Chan" <towinchenmi@gmail.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Sven Peter" <sven@kernel.org>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Apple Silicon drivers
From: =?utf-8?q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
To: "Janne Grunau" <j@jannau.net>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net> <20251231-arch-arm64-apple-defconfig-v1-2-4ff19805ba39@jannau.net>
In-Reply-To: <20251231-arch-arm64-apple-defconfig-v1-2-4ff19805ba39@jannau.net>

Hello, I'm not a kernel developer so this might be entirely irrelevant,
but while browsing the list I noticed something you might've missed:

On Wed Dec 31, 2025 at 16:42 CET, Janne Grunau wrote:
> From: Sven Peter <sven@kernel.org>
>
> Enable drivers for hardware present on Apple Silicon machines. None of
> these drivers are critical so build them as modules.
[...]
> Link: https://lore.kernel.org/asahi/20250612-apple-kconfig-defconfig-v1-0=
-0e6f9cb512c1@kernel.org/
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Janne Grunau <j@jannau.net>
>
> ---
> Changes compared to the original submission:
> - Remove AIC and APPLE_PMGR_PWRSTATE as those are selected by ARCH_APPLE
> - Add new macsmc drivers (mfd, reset, hwmon, rtc and gpio)
> - Add BACKLIGHT_APPLE_DWI, DRM_PANEL_SUMMIT and NVMEM_APPLE_SPMI
>   (suggested by Nick Chan)

What about DRM_ADP which Nick also mentioned?

> - Add PWM_APPLE and APPLE_M1_CPU_PMU
[...]

I tried to check whether it had possibly been taken care of elsewhere,
but I didn't find anything related on the mailing list(s) nor in the repo.

Cheers,
Piotr Mas=C5=82owski
