Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C02BDC0B;
	Wed, 25 Feb 2026 19:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046410; cv=none; b=C2iJcL/+480I/YHjZXlKGyMdjBZz7D9rDBrfjHOYcTLQZ1oJzFLE/IxdiHUbLjjJy1MCcr1WpVUu+WMQJdQwI4q6ys5H7pk7TvcCtL2hRgCwIdoBN0THPsklbDTHMxMzFtXWeHh6iogEskFPdI8fyXckDm3EhXMBzybjNfhHgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046410; c=relaxed/simple;
	bh=CkF2t8pRuS74frv5kvj9lORnS27YFPg618nCWr1Qn6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XHJaii9FZuMf61IdwYWUHXxGoBMFZxG6+/BXmbOVUaQBIINICQTuG2qoP9z8zVQHjBoF80t7ts1htwChBMe4D3f3K2oQsSQYtb0M1w2vpWHDjb8SLkTAF5JghMdtGACFj6tqkNNerTun1cPFM3bFVT7Jvkxz73o8UCy1I/aDNkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEwqBYzu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEwqBYzu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0949CC19421;
	Wed, 25 Feb 2026 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046410;
	bh=CkF2t8pRuS74frv5kvj9lORnS27YFPg618nCWr1Qn6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fEwqBYzuisJzZFLaNXC2/Siri2s27nszmXZUOHm4uJ3lrv6rdifahP13kPkv8iU++
	 872LULForDTlAejjPQm2UicYYv0L2L7RXYjPoTXfsN0oZahkiRzFKr1hUtD9/Js5Si
	 9QgneQzrgp00+lAeNKhYzAfllpwkkzXXpkmMrphrn3wXlqFRl3bUtUDqjObfSpsHUZ
	 6GjvF0zUVWZbiEn90lRzbqnKWneOsoHHVcC/zPkLRLyM24QSoWVYimj/1FHvFrm6B2
	 /4os9rB4VZAH83t62VvC0fAjPWY+U2Ht6mJ4XefGRjlCzyPLt0w7C3uklY+921i0Sc
	 w9tW9LBwopTbA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, 
 povik+lin@cutebit.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, Tim Bird <tim.bird@sony.com>
Cc: linux-spdx@vger.kernel.org, asahi@lists.linux.dev, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260217190837.165504-1-tim.bird@sony.com>
References: <20260217190837.165504-1-tim.bird@sony.com>
Subject: Re: [PATCH v2] ASoC: Add SPDX ids to many soc files
Message-Id: <177204640678.168100.16145526317077921085.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 19:06:46 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Tue, 17 Feb 2026 12:08:37 -0700, Tim Bird wrote:
> Add appropriate SPDX-License-Identifier lines to the
> the remaining files that are missing such lines in the
> sound/soc directory, and in a few other miscelaneous files.
> Remove boilerplate license text.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Add SPDX ids to many soc files
      commit: 0fa3df83d5537c5cc3eacb9896c457f0c22791f8

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

