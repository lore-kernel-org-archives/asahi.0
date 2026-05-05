Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D83839B482;
	Tue,  5 May 2026 11:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982300; cv=none; b=NdmvYU9FYI+W2+JibrupSIydlRYZbNgNC+O+2mmYgEq2B464Dlni5kl7RazvLn4e/V1UjyEU35DrbSxahjOlVRGEf6t8Sczu3BV3iPj1OBoN6WiLWtMI/5YnU1yQfposeX1Au/pZgp+ljqU0bnEfd46mQDwkuObeYy2Sw3DRrak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982300; c=relaxed/simple;
	bh=xeHgIov2eBpdGzkI2CwiiBe+BA7OivIJjLZsOU3eaw0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NOTZMzAXrxLbbWA7u9dWYSTCa4ptET8JOyvsc097YtS0sB7LKDMSAqOTgxmCJX/QwBRzyF+1qK7/UicezvK0ZMmK9n5ztwuju2ODZ9jOVtZzgB4/Qqu9mPS0oD1N1uNMVopwqj1W0Q3SwEgbHahoAIEyMPGfZ/Bq9fPPBUSzj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYN5N1rc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYN5N1rc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF412C2BCB9;
	Tue,  5 May 2026 11:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777982300;
	bh=xeHgIov2eBpdGzkI2CwiiBe+BA7OivIJjLZsOU3eaw0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fYN5N1rchR7eEvP0govyfmD6MHZoqKNVzkzvxVNi0Sas2SUr2iGMcQdsXawiHjDdU
	 0cctc47NJyEbVT5jmIC/dZEAD5nca5uBnOfPOIT7NyTQ3hJFF1O7O5aSs6MbtL+VIY
	 jHESJv8Pg21JJno+GBYvveiqtMaZwrZCE9cI16et41fM1fvkfrAg+z68OShEbRFTp5
	 8A35krKli6nZhiOF8TNokue0WTiwRaOdfhkhcnvx2AJ5z04v4r3cArxm0VKGgbUyEA
	 wAcIZMBzfgjaRvo5EHqO3qlZDJXK52juCNUynq+rr9G/CXr7uvxpB1sVzJQANzNExX
	 JpsPBI2lQg6Kg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Sen Wang <sen@ti.com>, James Calligeros <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev
In-Reply-To: <20260503-tas27xx-hwmon-fixes-v2-0-208e802be4ac@gmail.com>
References: <20260503-tas27xx-hwmon-fixes-v2-0-208e802be4ac@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: tas27{64,70}: Fixes for hwmon temperature
 readout
Message-Id: <177798229732.597350.3675316757687862413.b4-ty@b4>
Date: Tue, 05 May 2026 20:58:17 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Sun, 03 May 2026 22:23:22 +1000, James Calligeros wrote:
> This series makes some fixes to the hwmon temperature reading
> functionality added as part of [1].
> 
> - The arithmetic for TAS2770 was incorrect, leading to readings
>   which deviated from the true value sampled by the ADC.
> - TAS2764 was returning the cached value for each read after the
>   first register sampling.
> - Both chips were returning nonsense values before the ADC was
>   fully powered up, causing issues with some monitoring software.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tas2764: Deal with bogus initial temperature register value
      https://git.kernel.org/broonie/misc/c/915f9860fe1c
[2/2] ASoC: tas2770: Deal with bogus initial temperature value
      https://git.kernel.org/broonie/misc/c/d0771f4995d3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

