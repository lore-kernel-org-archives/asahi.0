Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0413C1109
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 06:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="W9Zd6c7d"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A6DC04265F;
	Sun, 29 Oct 2023 06:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698561511; bh=WOSXcCARPO3Y877Gj9RL2Bh5pG7UjYtb7uLJsT742Qk=;
	h=From:Subject:Date:To:Cc;
	b=W9Zd6c7duyTvMLIUomZSiJq8XyY66VQred5V6B2yTW60oZCo5rM1ImmDnePTJUJG0
	 Jja4TXxL/1XAn/3Y5snrgdlVpjr+uPnn9jaf/Gf7IDiaQan7Md4GukZiGhDJwdr3H3
	 wjLV9GmN+2s9KkZtb8NeY2mRxKssuOk6JPT121BMux2nWLXGtBDp2gYdqgwtovjre1
	 viwVqkdlUBwSSmMRbStggcKzzgHh1EQPEJWlsPhOc6ULp52/ZNMkDmTgeGtUDSMRjS
	 1X22TTL9ipqRPSVCeGtcoKM2jcDYbpZOhtSWZp6lFTCowRSANO5oYgR3egDzxWUK/O
	 gdXXnNywCLrqQ==
From: Hector Martin <marcan@marcan.st>
Subject: [PATCH v2 0/8] USB fixes: xHCI error handling
Date: Sun, 29 Oct 2023 15:37:37 +0900
Message-Id: <20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALH9PWUC/22MQQ7CIBBFr9LM2jEMLEpdeQ/TBdCpZSE1TCWah
 ruLXbt8/+e9HYRzZIFLt0PmEiWuqYE+dRAWl+6McWoMWmlDSvf4Eo9zfLMgoTV+Dr0io0hDM56
 Zj6sJt7HxEmVb8+eIF/qt/zuFUCEF2w/eh2nQ9vpwObh0lg3GWusXpBMPnKYAAAA=
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>, 
 u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3894; i=marcan@marcan.st;
 h=from:subject:message-id; bh=WOSXcCARPO3Y877Gj9RL2Bh5pG7UjYtb7uLJsT742Qk=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlTbv7ebEpwyLy7oX1t979G7vdtabkpsqxWT/Zoud2aq9
 l83f94NHaUsDGIcDLJiiiyNJ3pPdXtOP6eumjIdZg4rE8gQBi5OAZhIgy4jw5rdVeHh3Mua/vJ1
 cJ5NkdbiP2PaEmPyT8Np9Z7Hjzbui2RkeKElXTLrV/275J9cff1CCydKvYjYcyxj9Zzv0/gTRVK
 CmAA=
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

This series is the first of a few bundles of USB fixes we have been
carrying downstream on the Asahi U-Boot branch for a few months.

Patches #1-#6 fix a series of related robustness issues. Certain
conditions related to endpoint stalls revealed a chain of bugs
throughout the stack that caused U-Boot to completely fail when
encountering some errors (and errors are a fact of life with USB).

Example scenario:
- The device stalls a bulk endpoint due to an error
- The upper layer driver tries to use the endpoint again
- There is no endpoint stall clear wired up in the API, so for starters
  this is doomed to fail (fix: #4)
- xHCI knows the endpoint is halted, but tries to queue the TRB anyway,
  which can't work (fix: #5)
- Since the endpoint is halted nothing happens, so the transfer times
  out.
- The timeout handling tries to abort the transfer
- abort_td() tries to stop the endpoint, but since it is already halted,
  this results in a context state error. As the transfer never started,
  there is no completion event, so xhci_wait_for_event() is waiting for
  the wrong event type, and logs an error and returns NULL. (fix: #2)
- abort_td() crashes due to failing to guard against the NULL event
  (fix: #1)
- Even after fixing all that, abort_td() would not handle the context
  state error properly and BUG() (fix: #3). This also fixes a race
  condition documented in the xHCI spec that could occur even in the
  absence of all the other bugs.

Patch #6 addresses a related robustness issue where
xhci_wait_for_event() panics on event timeouts other than for transfers.
While this is clearly an unexpected condition and indicates a bug
elsewhere, it's no reason to outright crash. USB is notoriously
impossible to get 100% right, and we can't afford to be breaking users'
systems at any sign of trouble. Error conditions should always be dealt
with as gracefully as possible (even if that results in a completely
broken USB controller, that is much preferable to aborting the boot
process entirely, especially on devices with non-USB storage and
keyboards where USB support is effectively optional for most users).
Since after patch #1 we now guard all callers to xhci_wait_for_event()
with at least trivial NULL checks, it's okay to return and continue in
case of timeouts.

Patch #7 addresses an unrelated bug I ran into while debugging all this,
and patch #8 adds extra debug logs to make finding future issues less
painful.

I believe this should fix this Fedora bug too, which is either an
instance of the above sequence of events, or (more likely, given the
difficulty reproducing) the race condition documented in xHCI 4.6.9:

https://bugzilla.redhat.com/show_bug.cgi?id=2244305

Signed-off-by: Hector Martin <marcan@marcan.st>
---
Changes in v2:
- Squashed in a trivial fix for patch #1
- Removed spurious blank line
- Added a longer description to the cover letter
- Link to v1: https://lore.kernel.org/r/20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st

---
Hector Martin (8):
      usb: xhci: Guard all calls to xhci_wait_for_event
      usb: xhci: Better error handling in abort_td()
      usb: xhci: Allow context state errors when halting an endpoint
      usb: xhci: Recover from halted bulk endpoints
      usb: xhci: Fail on attempt to queue TRBs to a halted endpoint
      usb: xhci: Do not panic on event timeouts
      usb: xhci: Fix DMA address calculation in queue_trb
      usb: xhci: Add more debugging

 drivers/usb/host/xhci-ring.c | 99 ++++++++++++++++++++++++++++++++++++--------
 drivers/usb/host/xhci.c      |  9 ++++
 include/usb/xhci.h           |  2 +
 3 files changed, 92 insertions(+), 18 deletions(-)
---
base-commit: 7c0d668103abae3ec14cd96d882ba20134bb4529
change-id: 20231027-usb-fixes-1-83bfc7013012

Best regards,
-- 
Hector Martin <marcan@marcan.st>

