Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3826830DEB8;
	Sun,  5 Jul 2026 14:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783261788; cv=none; b=jeW39qTLJKWpu8HwUOu2ZW85fpNB9KuEZuPpu3l1hB34lLWnPT1IEdXCeuSixjoWg76aaMZLMtv0wSPd0EzsFJdwMbCWk+MpSIzcBwHX6D/GXjHR36gpmSBgPeqyyslVKYBCeB/D2FiSC7+UBRdpmWCfmPHF5uVQhAtPl1uDiqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783261788; c=relaxed/simple;
	bh=qbrNbNAa1Vt5JRc6CEL3Gu+jcyQ2MqOw+3K/zMEmbqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=divvUatTqsLtPjQkbMtxryBKQwQST726cvfcvd2Ur6P5LVwYi+JDpZNjuSduwG/BmxGh1P8t254EqHiuUqsi4KlLAJg26CGbbu5v5bN63rkRXPR85z8QWA/Gm4guJJoy0D0M3DSsTObMWIE3FzaLkMfvq198i7fAlkPEKbqSrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNDCx/n8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNDCx/n8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7A21F000E9;
	Sun,  5 Jul 2026 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783261786;
	bh=Wu44kjt2jgbV0ZflrkPNRFsVj1L2e1+MVXtOhpoAnqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UNDCx/n8I/gXJ25IhVcUDEQvWQLjfcQ5SxCtsV4I15uNFUNIImmKDGglWr1Qoopl5
	 75hc0Muq/lWlgZiDPs1oKifpCNcYJqho87JPaqaE94cSEX2KVGMtg60XmDBYF5p1L4
	 m+v34mp/26hMz2XaSYHizt/Ht2qmlffvYBaU9IReIaYY4zMafCH70a+PTWUQ08F4E0
	 FJqlVTAx3cLevPs0GJ+vOTCFIxYpcCrWA3R0diLQuDiK/4NzdjC3ZGRc3+WdakYz4W
	 4J505RQ716dhefE9Nvt0qKWoCE1OOlEUBoPLX4a75f58lJdIM1JhLK1Wp8LDmz7osg
	 wpAh5nV1CMSRQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH] soc: apple: sart: require device link for consumers
Date: Sun,  5 Jul 2026 16:29:28 +0200
Message-ID: <178326164441.9177.8657526397419269575.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260616005346.7862-1-pengpeng@iscas.ac.cn>
References: <20260616005346.7862-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 16 Jun 2026 08:53:46 +0800, Pengpeng Hou wrote:
> devm_apple_sart_get() obtains the supplier platform device and attempts
> to create a runtime-PM device link to it, but it ignores device_link_add()
> failure.  A consumer can then continue without the dependency that keeps
> the SART supplier ordered and runtime-PM reachable.
> 
> Treat a failed device link as an error and drop the supplier device
> reference before returning.
> 
> [...]

Applied to sven/linux (apple-soc/fixes-7.2), thanks!

[1/1] soc: apple: sart: require device link for consumers
      https://github.com/AsahiLinux/linux/commit/36887b488b253

Best regards,
-- 
Sven Peter <sven@kernel.org>

