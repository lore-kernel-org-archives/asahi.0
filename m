Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F13C31E826;
	Tue, 14 Apr 2026 20:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776198285; cv=none; b=pxOnUtcOzW7WEghscKR9b55fZtlOkBhwd3RqAZJCzgVXB0WtkCWpIa7RRFy1myOYNuqIiE5/2Rsbbb7yjGivI+yGbaJDVhmshXVx4QZY9EgXEik2by7J1BT14XHbMYrzmETBi7Lptxgc16nLREKHNEOO9FqkQbgzkc047yD1cJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776198285; c=relaxed/simple;
	bh=9gzrxKbw2rxLwue2MsvZ/QpDvJM6VvmWIy9J5cPJO0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dg9/wGAfxhngQZJ4LzEs+NObgl4JVjEMzuhTCnDyk59PT/sriISaWPPk+8o2eSApJdq6H3LQQ/vnW6AEGLhMQBsThOz8wH0NDsVxTGcBazdghp052rfPyN7SU9l7Bx0utwichxfuCXsITr5uK47YSqHzEYN7LssEtN1Ee6+2aTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iB9npNQd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iB9npNQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C97C19425;
	Tue, 14 Apr 2026 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776198284;
	bh=9gzrxKbw2rxLwue2MsvZ/QpDvJM6VvmWIy9J5cPJO0s=;
	h=From:To:Cc:Subject:Date:From;
	b=iB9npNQd4Uq8GqWbc6nfDQCUGz/NKMH077as1pAwywYc5wRCRfAktsxJjnD7VG4Fm
	 YiCfAoH9UJSR3T0Fey7YxZS2PeoRdN8bLXMetpjdu1gbDVEPCX3ikAEv8wJEosCETX
	 6kFn24oRkmPRTttdSqHgk9PraPWwhf0lTY4dyPgTbCXCOI3UGZ2AdUvIzporkOEERm
	 Q2czFlISg7eqB6/oWEKoHVxHDj6lri+116jn/Ve/7jhlRhXTx3Kjtqjt6iJ0d1WeC8
	 zaduqioMFVbova++50cAcnZ05BNrs/puRC81gQuFmglTBud0VMLHmPFqEHlIXMMfvH
	 xPzXaQrY2loEA==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC fixes for v7.0
Date: Tue, 14 Apr 2026 22:24:25 +0200
Message-ID: <20260414202428.5278-1-sven@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Two fixes without any functional changes, they just update Sasha's email
everywhere and fix a typo in a dtsi file comment.
As discussed with Arnd I'm already sending out the PR now so that you guys can
decide when to merge this.


Thanks,


Sven


The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

  Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-fixes-7.0

for you to fetch changes up to c7ff53ef45b2f879576f7bbeb163828d04f5f491:

  arm64: dts: apple: Fix spelling error (2026-04-14 22:13:19 +0200)

----------------------------------------------------------------
Apple SoC fixes for 7.0

Two commits without any functional changes that arrived just before the
merge window opened:
- Update Sasha's email address in all dt-bindings, MAINTAINERS and add
  him to mailmap
- Fix a typo in spi1-nvram.dtsi

----------------------------------------------------------------
Axel Flordal (1):
      arm64: dts: apple: Fix spelling error

Sasha Finkelstein (2):
      mailmap: Update Sasha Finkelstein's email address
      dt-bindings: Update Sasha Finkelstein's email address

 .mailmap                                                                | 1 +
 .../devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml         | 2 +-
 Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml    | 2 +-
 Documentation/devicetree/bindings/display/panel/apple,summit.yaml       | 2 +-
 Documentation/devicetree/bindings/gpu/apple,agx.yaml                    | 2 +-
 .../devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml      | 2 +-
 Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml           | 2 +-
 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml               | 2 +-
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml                  | 2 +-
 MAINTAINERS                                                             | 2 +-
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi                               | 2 +-
 11 files changed, 11 insertions(+), 10 deletions(-)
