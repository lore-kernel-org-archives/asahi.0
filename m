Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7619A3A4F2B;
	Wed, 14 Jan 2026 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409516; cv=none; b=u9k0RcbS0FMWPStaUDe95hLakVkvz7whrZHlxH1i5oVdyCeZtQlmbThHISCBbiw2aOOXCK+mnJabUoSjcx5qsw6S5IWXM2lhw4zIVl3uA4a2tu1QWeTqPE0AzOGkWfJN90BmISnIqnHJuNzW9SFQK5j90G+okxINsUyhRBg2o2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409516; c=relaxed/simple;
	bh=yB/TEwjeZj76CFSPXcigHhXplmVJWILyO+nteFdd1iY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LDi9+4RNFWZODMVuxM1fYE8TE2AnMDzGm1jHHv0qXjHAjLE5otZM/TVvcvhwz9k4ss8ShhCy3HxdS+dXwBOZ7zYeNbOzuq4pB96Iewii1jzxjZ6QSx8tfNZp7Iz8gwjg3rdjja1oIJXtCr6dBnmQcY3ZQZ/+mllcXyQHIZz2/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOdkPBoD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOdkPBoD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6F5C4CEF7;
	Wed, 14 Jan 2026 16:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768409516;
	bh=yB/TEwjeZj76CFSPXcigHhXplmVJWILyO+nteFdd1iY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UOdkPBoDeaPWlCOlwlGuYiojKezsUWwMSocBQ1uS1ger1x2nCWG5DK8/lPuYf+cmJ
	 vMA2zQqOVQot2SbaS15P2WMosdMskRAZi9HgPBH82L3u8mSf1PLX59hoJp12AX7yyc
	 e43LDHSDoWqP9la/M83rqsTjfz8gKECGw8DvWsfy610TmCtu0xfOym3GhEf/uZA8j3
	 C5+Fzsd0YQL0nwhOBp864dcPnVAf90XcJ/rXlcvE2SqYOK4g+H7bOKXfAyWCpbvjAO
	 52+2Le4XEB8k/DftUcQw1mJkGj+FEPgXfoGd8m2+aJZ4WV0r2j7GwXVsklPFnzQH0F
	 g3Mbel+wpaWaA==
From: Vinod Koul <vkoul@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Glanzmann <thomas@glanzmann.de>
In-Reply-To: <20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org>
References: <20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org>
Subject: Re: [PATCH next v2] phy: apple: atc: Actually check return value
 of devm_apple_tunable_parse
Message-Id: <176840951359.979558.10661452762725106563.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 22:21:53 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sun, 04 Jan 2026 22:56:39 +0100, Sven Peter wrote:
> Let's actually check the return value of devm_apple_tunable_parse
> instead of trying to check IS_ERR on a pointer to the return value which
> is always going to be valid. This prevent a oops when the tunables are
> invalid or when they don't exist:
> 
> [   57.664567] Unable to handle kernel paging request at virtual address fffffffffffffffe
> [   57.664584] Mem abort info:
> [   57.664589]   ESR = 0x0000000096000007
> [   57.664595]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   57.664602]   SET = 0, FnV = 0
> [   57.664607]   EA = 0, S1PTW = 0
> [   57.664611]   FSC = 0x07: level 3 translation fault
> [   57.664617] Data abort info:
> [   57.664621]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> [   57.664626]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   57.664631]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   57.664640] swapper pgtable: 16k pages, 47-bit VAs, pgdp=0000000b4391c000
> [   57.664647] [fffffffffffffffe] pgd=0000000000000000, p4d=0000000000000000, pud=0000000b44188403, pmd=0000000b4418c403, pte=0000000000000000
> [   57.664670] Internal error: Oops: 0000000096000007 [#1]  SMP
> [   57.665047] CPU: 1 UID: 0 PID: 23 Comm: kworker/1:0 Tainted: G S                  6.18.2+ #2 PREEMPTLAZY
> [   57.665061] Tainted: [S]=CPU_OUT_OF_SPEC
> [   57.665066] Hardware name: Apple Mac mini (M1, 2020) (DT)
> [   57.665072] Workqueue: events cd321x_update_work [tps6598x]
> [   57.665100] pstate: 61400009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [   57.665111] pc : apple_tunable_apply+0x8/0x80 [apple_tunable]
> [   57.665121] lr : atcphy_mux_set+0x3e0/0x1138 [phy_apple_atc]
> [   57.665133] sp : ffffc000802a7c00
> [   57.665138] x29: ffffc000802a7c00 x28: 0000000000000003 x27: ffff800016c84080
> [   57.665151] x26: 0000000000000002 x25: ffff800016c84090 x24: ffff800016c8408f
> [   57.665163] x23: 0000000000020004 x22: 0000000000000001 x21: 0000000000000006
> [   57.665175] x20: ffff80000d6da9b0 x19: ffff80000d6da880 x18: 0000000000000002
> [   57.665188] x17: 0000000000000000 x16: ffffe22de59e0e38 x15: 0000000000000002
> [   57.665199] x14: ffffe22de76ecff8 x13: 0000000000000001 x12: ffff9dd5f90bc000
> [   57.665211] x11: 00000000000000c0 x10: 048abc15ceba0919 x9 : ffffe22dbc5fde10
> [   57.665223] x8 : ffff80000175e0d8 x7 : 0000000000000004 x6 : 0000000000000000
> [   57.665234] x5 : 0000000000000001 x4 : 0000000d6d132db7 x3 : 00000000000155db
> [   57.665246] x2 : 0000000000000000 x1 : fffffffffffffffe x0 : ffffc00082b80000
> [   57.665258] Call trace:
> [   57.665265]  apple_tunable_apply+0x8/0x80 [apple_tunable] (P)
> [   57.665276]  typec_mux_set+0x74/0xe0 [typec]
> [   57.665315]  cd321x_update_work+0x440/0x8c0 [tps6598x]
> [   57.665332]  process_one_work+0x178/0x3d0
> [   57.665346]  worker_thread+0x260/0x390
> [   57.665354]  kthread+0x150/0x250
> [   57.665369]  ret_from_fork+0x10/0x20
> [   57.665386] Code: e69a0ae8 ffffe22d aa1e03e9 d503201f (f9400022)
> [   57.665394] ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied, thanks!

[1/1] phy: apple: atc: Actually check return value of devm_apple_tunable_parse
      commit: 7d55b44e2be1069504e22253d26d08982884f930

Best regards,
-- 
~Vinod


