Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7011C19E
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 01:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B3B4C433D6;
	Tue,  8 Nov 2022 01:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667869216;
	bh=ma4Mel+r4wJmpVvhzxTUsdruuj5LRP8y1aHtf0Or6x0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=n83rsdK7cKabZQdvi3CLDRnAqxKQfk017QpghF6KvydKzqhe3a/CymD4s1eHZGbcG
	 9Ud4EoVMdoW73Gs7Yx73gOst2Y+2SqL5GiTkT1jkc6O+CymDRREZpikA4xtV/ppyUm
	 C1tgCJHKjWNmRoh7RQg8OUQI6J7x7lmDllGGCwnGXiBl68ERO5Tig7udI+WaPqF8sT
	 TYoFpadibBW/vxn14p65AMM7m45nO8czPa2wOVNCIT/9Kj4N5LKPWXJNq9obNvKZk8
	 XTTpzRXR3Z0M4nzbpF4YPMHEtUH1gK79dGi6NWFCL4RdvDkIpSs+j2qUyohhqLiahh
	 GrO+JzH48JV0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 048E0E270D0;
	Tue,  8 Nov 2022 01:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/7] Broadcom/Apple Bluetooth driver for Apple Silicon
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <166786921601.3686.4643669436357800810.git-patchwork-notify@kernel.org>
Date: Tue, 08 Nov 2022 01:00:16 +0000
References: <20221104211303.70222-1-sven@svenpeter.dev>
In-Reply-To: <20221104211303.70222-1-sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, pabeni@redhat.com, robh+dt@kernel.org,
 marcan@marcan.st, alyssa@rosenzweig.io, asahi@lists.linux.dev,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri,  4 Nov 2022 22:12:56 +0100 you wrote:
> Hi,
> 
> v1: https://lore.kernel.org/asahi/20220801103633.27772-1-sven@svenpeter.dev/
> v2: https://lore.kernel.org/asahi/20220907170935.11757-1-sven@svenpeter.dev/
> v3: https://lore.kernel.org/asahi/20220919164834.62739-1-sven@svenpeter.dev/
> v4: https://lore.kernel.org/asahi/20221027150822.26120-1-sven@svenpeter.dev/
> 
> [...]

Here is the summary with links:
  - [v5,1/7] dt-bindings: net: Add generic Bluetooth controller
    https://git.kernel.org/bluetooth/bluetooth-next/c/dea8565cb4a6
  - [v5,2/7] dt-bindings: net: Add Broadcom BCM4377 family PCIe Bluetooth
    https://git.kernel.org/bluetooth/bluetooth-next/c/f29c81596cd9
  - [v5,3/7] arm64: dts: apple: t8103: Add Bluetooth controller
    https://git.kernel.org/bluetooth/bluetooth-next/c/58092596a45f
  - [v5,4/7] Bluetooth: hci_event: Ignore reserved bits in LE Extended Adv Report
    https://git.kernel.org/bluetooth/bluetooth-next/c/7e551e41a298
  - [v5,5/7] Bluetooth: Add quirk to disable extended scanning
    https://git.kernel.org/bluetooth/bluetooth-next/c/612a79830bed
  - [v5,6/7] Bluetooth: Add quirk to disable MWS Transport Configuration
    https://git.kernel.org/bluetooth/bluetooth-next/c/d73a5e165e2e
  - [v5,7/7] Bluetooth: hci_bcm4377: Add new driver for BCM4377 PCIe boards
    https://git.kernel.org/bluetooth/bluetooth-next/c/ab80b2cec05f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


