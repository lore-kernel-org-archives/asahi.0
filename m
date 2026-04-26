Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DDE26A08A;
	Sun, 26 Apr 2026 23:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245749; cv=none; b=MUKAM6GuxbI15cPsIdvIyx4JAqh5vvoCFOvf10T9B2B5v7MEdj6UyESlWy4mGAXW4ThbdUC/xHZfFhWBBXeRwkC3RlbDMFKcsTRkSjk8kQaBlTulCSUKcXrJ6k/BUnZAud096fdweOnJOjTXKvXV4L9Ehiz/8Oqt7PozHdT+VY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245749; c=relaxed/simple;
	bh=FU/k+L8i7Ta4OHCpZRnzemqVs2DF9E6WhaOdevkZjGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=osGLRmbg9FZViwZ00rVJk6lYVi0t1UFlWmRsXyrX/jwZlxdWUtfv3Vqt7pYGwA87N+sldX2PMkKQ9twNIF4Ap7/fpNGuAsoa9Kgbe2QpYo5I3UZte3pNbSa9riocArCxoEXZUPu9Z8X9omeWpddqxNGnPqLRv+d9I0i9DAqHyLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dskz/xhh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dskz/xhh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F29FC2BCB8;
	Sun, 26 Apr 2026 23:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245748;
	bh=FU/k+L8i7Ta4OHCpZRnzemqVs2DF9E6WhaOdevkZjGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dskz/xhhzU5GTHSCU/lVXrHZEG4iz15DZ1FYmfANNQavfuQGHEpgrifREDyKCwFkW
	 bdztSlGdS52GO5BIizzSmMEM1cdSdX+Zago6un6CBjpRVpmJxzMTv9KS+clvPN9Osb
	 2BhV+cCRdyjGFB8PZ2MyWxIB6bCqpE3zt8OWLtQxa+JdL/uT4fgAarjThjvQ/NwUQG
	 hkUaT/i6cSpfeh5B8zwzqQFiGiU/iBW1REf94huWOp0ZgO2C01NpoSizxorEIvOlCx
	 ycFt3V8GJmgRDwEUXel3Y8nbGHClqyYRHbGxRo7IlCAdyJamvtAomNtVvJ3cCoUWno
	 dVgUBc+0Zpc2g==
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260423125154.156257-1-phucduc.bui@gmail.com>
References: <20260423125154.156257-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: apple: mca: Use guard() for mutex locks
Message-Id: <177724034927.266775.12675076324275289049.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:52:29 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FU/k+L8i7Ta4OHCpZRnzemqVs2DF9E6WhaOdevkZjGA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4ypWpJ6CbBU3iQ0ipBBmPE5ZIFP1UPsdBft
 evB2cIqRq+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6eMgAKCRAk1otyXVSH
 0MYjB/9h5ZcVrhGxChFdnig5i5XRxG0+9F2VTT2ZIN9Zw2sXcK8tsIm6pbzJtP2HAFzI6YVM06N
 vC7mhFD9eOGiTQtV/wKBsX/u8LP6RP9JE98ousbYVQNTrjuWuSrN4LLFiB3Cpx3iNd1hhzDd5Zz
 C/J6uCwNMPk+Sh4FnKAevzk/EUX1/Hobdrm2osG83n7NW6ID4tsr7bsZXBFrwqg2bHoDaYbFIZ6
 RxgZo+3XUAvAzVbNXvZixtCS3lx7iloIQqha4AzschbSk9i0d4d/1/VWhmvutgnPlwmqvsTzdHz
 JujbnWwMcZT23aEuuO/q9jlLkrjT3FeWFl0/UU+Sk3q2VC8o
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Apr 2026 19:51:54 +0700, phucduc.bui@gmail.com wrote:
> ASoC: apple: mca: Use guard() for mutex locks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: apple: mca: Use guard() for mutex locks
      https://git.kernel.org/broonie/sound/c/fc86d55e8b78

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

